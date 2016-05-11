//
//  ViewController.m
//  CellHeightDemo
//
//  Created by mac on 16/5/11.
//  Copyright © 2016年 陌上北辰. All rights reserved.
//

#import "ViewController.h"
#import "TableCell.h"
static NSString *cellReuseID = @"cellReuseID";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (assign, nonatomic) CGFloat originCellMaxY;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArray = [@[
                         @"asldfjasdjiofisoadfjioasojidfjioasoidfjioasdijofjoasdiojf",
                         @"sadfasldfjasopdfkpasdfkasodfkpoasdfkpasdkfpasokdfpoasdfpaoskdpoaksgpfogjapodfjgdpsofjgpdsfgjdpfjgoasdkpoasdgkopasd",
                         @"sadfjiasodjfiasjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofge",
                         @"sjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofge",
                         @"sjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofge",
                         @"sjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofge",
                         @"sjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofge",
                         @"sjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgeds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgeds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofgesjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofge",
                         @"sjdflsajdglfdjgiodfjgldsfjgpasojfoaejrger;godfgkds;fogksdfgkdsfgsdf;okgsdofgsdofge",
                         @"sadfasdfasdfasd",
                         ] mutableCopy];
    [self createTableView];
    self.originCellMaxY = [self getCellLastControlMaxY];

}

-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStylePlain ];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableCell *cell=[tableView dequeueReusableCellWithIdentifier:cellReuseID];
    if (cell == nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"TableCell" owner:self options:nil] lastObject];
    }
    
    cell.titleLabel.text= self.titleArray[indexPath.row];
    
    
    //获取不确定文字的高度
    NSString *content=self.titleArray[indexPath.row];
    CGFloat testHeight=[self sizeWithFont:[UIFont systemFontOfSize:14] maxW:cell.frame.size.width withContent:content]-20;
    
    //重新设置cell的frame
    CGRect  frame=cell.frame;
    frame.size.height=testHeight+self.originCellMaxY;
    
    cell.frame=frame;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSLog(@"%f",cell.contentView.frame.size.height);
    return cell;
}

//计算指定文字的高度
-(CGFloat)sizeWithFont:(UIFont *)font maxW:(CGFloat) maxW withContent:(NSString *)testStr{
    NSDictionary *textAttrs=@{NSFontAttributeName:font};
    CGSize size=CGSizeMake(maxW, MAXFLOAT);
    
    
    return [testStr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttrs context:nil].size.height ;
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    // 直接返回该indexPath对应cell的frame.size.height. (在cellForRowAtIndexPath方法中会重新更改)
    TableCell *cell = (TableCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

// 获取cell最底部控件的最大Y值
-(CGFloat)getCellLastControlMaxY {
    // 获取cell中最底部的控件
    TableCell *tempCell = (TableCell *)[[[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:nil options:nil] lastObject];
    UIButton *lastButton = tempCell.lastButton;
    return  lastButton.frame.origin.y + lastButton.bounds.size.height;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
