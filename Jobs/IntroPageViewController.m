//
//  IntroPageViewController.m
//  Jobs
//
//  Created by 王振辉 on 15/6/22.
//  Copyright (c) 2015年 王振辉. All rights reserved.
//

#import "IntroPageViewController.h"
#import <EAIntroView/EAIntroView.h>
#import "AppDelegate.h"
#import "AllListsViewController.h"

static NSString * const sampleDescription1 = @"HR打电话的时候，我再也不会忘记当初报的是哪个职位了。";
static NSString * const sampleDescription2 = @"灰色公司任务向右“短滑”恢复。";
static NSString * const sampleDescription3 = @"灰色公司任务向右“长滑”永久删除";
static NSString * const sampleDescription4 = @"简单，在细节中。向左滑开始我的计划";

@interface IntroPageViewController ()
    
@end

@implementation IntroPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showIntro];
    // Do any additional setup after loading the view.
}

- (void)showIntro{
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello Jobs";
    page1.titleColor = [UIColor colorWithRed:255.0/255.0 green:77.0/255.0 blue:0.0 alpha:1];
    page1.desc = sampleDescription1;
    page1.descColor = [UIColor colorWithRed:255.0/255.0 green:77.0/255.0 blue:0.0 alpha:1];
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"Jobs";
    page2.titleColor = [UIColor blackColor];
    page2.desc = sampleDescription2;
    page2.descColor = [UIColor blackColor];
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"Jobs";
    page3.titleColor = [UIColor blackColor];
    page3.desc = sampleDescription3;
    page3.descColor = [UIColor blackColor];
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"Jobs";
    page4.titleColor = [UIColor blackColor];
    page4.desc = sampleDescription4;
    page4.descColor = [UIColor blackColor];
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds];
    [intro setDelegate:self];

    intro.skipButton.alpha = 0.f;
    intro.skipButton.enabled = NO;
    
    [intro setPages:@[page1,page2,page3,page4]];
    [intro showInView:self.view animateDuration:0.3];
}

- (void)introDidFinish:(EAIntroView *)introView{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *navigationController = [storyBoard instantiateViewControllerWithIdentifier:@"FirstNavigationController"];
    navigationController.navigationBar.layer.shadowColor = [UIColor blackColor].CGColor; //shadowColor阴影颜色
    navigationController.navigationBar.layer.shadowOffset = CGSizeMake(2.0f , 2.0f); //shadowOffset阴影偏移x，y向(上/下)偏移(-/+)2
    navigationController.navigationBar.layer.shadowOpacity = 0.25f;//阴影透明度，默认0
    navigationController.navigationBar.layer.shadowRadius = 4.0f;//阴影半径
    
    AllListsViewController *controller = navigationController.viewControllers[0];
    controller.dataModel = self._dataModel;

    [self addChildViewController:navigationController];
    [self.view addSubview:navigationController.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
