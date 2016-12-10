//
//  ViewController.m
//  FMDB SharedManager
//
//  Created by 董建新 on 2016/12/1.
//  Copyright © 2016年 vpjacob. All rights reserved.
//

#import "ViewController.h"
#import "JJFMDBTool.h"

@interface ViewController ()

@property (nonatomic, strong) FMDatabase *dataBase;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //  创建数据库
    [self creat];
    

    
    
    //  创建表
    [self creatTabel];
    
    [self InsertTabelWithValue];
    [self InsertTabelWithValue];
    
    //     *  给指定数据库的表更新值
//    [self updataTablelWithValue];


    
//     *  条件更新
//     *  @param db        数据库名称
//     *  @param tableName 表名称
//     *  @param keyValues 要更新的字段及对应值
//     *  @param condition 条件
//    -(void)DataBase:(FMDatabase *)db updateTable:(NSString *)tableName setKeyValues:(NSDictionary *)keyValues whereCondition:(NSDictionary *)condition;
    
    
    
    //  进行查询
    [self selectTable];


//     *  条件查询数据库中的数据 限制数据条数10
//     *  @param db        数据库名称
//     *  @param keysTypes 查询字段以及对应字段类型 字典
//     *  @param tableName 表名称
//     *  @param condition 条件
//     *  @return 查询得到数据 限制数据条数10
    #pragma mark - 条件查询
//    NSArray* arr = [[JJFMDBTool tool] DataBase:self.dataBase selectKeyTypes:@{@"name":@"text"} fromTable:@"class" whereCondition:@{@"name":@"我是1"}];
//    
    

//     *  模糊查询 某字段以指定字符串开头的数据 限制数据条数10
//     *  @param db        数据库名称
//     *  @param keysTypes 查询字段以及对应字段类型 字典
//     *  @param tableName 表名称
//     *  @param key       条件字段
//     *  @param str       开头字符串
//     *  @return 查询所得数据 限制数据条数10

    
     NSArray* arr = [[JJFMDBTool tool] DataBase:self.dataBase selectKeyTypes:@{@"name":@"text"} fromTable:@"class" whereKey:@"name" beginWithStr:@"我是"];
    
    
    //    -(NSArray *)DataBase:(FMDatabase *)db selectKeyTypes:(NSDictionary *)keyTypes fromTable:(NSString *)tableName whereKey:(NSString *)key beginWithStr:(NSString *)str;
//    
//    
//    
//    /**
//     
//     *  模糊查询 某字段包含指定字符串的数据 限制数据条数10
//     
//     *
//     
//     *  @param db        数据库名称
//     
//     *  @param keysTypes 查询字段以及对应字段类型 字典
//     
//     *  @param tableName 表名称
//     
//     *  @param key       条件字段
//     
//     *  @param str       所包含的字符串
//     
//     *
//     
//     *  @return 查询所得数据
//     
//     */
//
    
    
//    NSDictionary* selectTable = @{@"name":@""};
//    NSArray* arr = [[JJFMDBTool tool] DataBase:self.dataBase selectKeyTypes:selectTable fromTable:@"class" whereKey:nil containStr:@""];
//    
//    NSLog(@"%@",arr);
    
//    -(NSArray *)DataBase:(FMDatabase *)db selectKeyTypes:(NSDictionary *)keyTypes fromTable:(NSString *)tableName whereKey:(NSString *)key containStr:(NSString *)str;
//    
//    
//    
//    /**
//     
//     *  模糊查询 某字段以指定字符串结尾的数据 限制数据条数10
//     
//     *
//     
//     *  @param db        数据库名称
//     
//     *  @param keysTypes 查询字段以及对应字段类型 字典
//     
//     *  @param tableName 表名称
//     
//     *  @param key       条件字段
//     
//     *  @param str       结尾字符串
//     
//     *
//     
//     *  @return 查询所得数据
//     
//     */
//    
//    -(NSArray *)DataBase:(FMDatabase *)db selectKeyTypes:(NSDictionary *)keyTypes fromTable:(NSString *)tableName whereKey:(NSString *)key endWithStr:(NSString *)str;


    
    
}

#pragma mark - 选择查询
//     *  查询数据库表中的所有值 限制数据条数10
-(void)selectTable{
    
    NSDictionary* selectTable = @{@"name":@"text"};
    NSArray* arr = [[JJFMDBTool tool] DataBase:self.dataBase selectKeyTypes:selectTable fromTable:@"class"];
    
}



#pragma mark - 清理数据库的内容
-(void)clearDatabase{
    [[JJFMDBTool tool] clearDatabase:self.dataBase from:@"class"];

}


#pragma mark -给指定数据库的表更新值
-(void)updataTablelWithValue{
    NSDictionary* dictupdataTable = @{@"name":@"DONGJIANXIN"};
    
    [[JJFMDBTool tool] DataBase:self.dataBase updateTable:@"class" setKeyValues:dictupdataTable];
    
}



#pragma mark - 给指定数据库的表添加值
-(void)InsertTabelWithValue{
    NSDictionary* dictInsert = @{@"name":@"我是12"};
    
    [[JJFMDBTool tool] DataBase:self.dataBase insertKeyValues:dictInsert intoTable:@"class"];
    
}


#pragma mark - 增加字段名
-(void)creatTabel{
NSDictionary* dict = @{@"name":@"DJX"};

[[JJFMDBTool tool] DataBase:self.dataBase createTable:@"class" keyTypes:dict];

}

#pragma mark - 创建数据库
-(void)creat{
    
   self.dataBase = [[JJFMDBTool tool] getDBWithDBName:@"djx.sqlite"];

}


@end
