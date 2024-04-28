# Maintainer: Colin Teng <tfcolin@88.com>
pkgname=slidegame
pkgver=1.1.4
pkgrel=1
pkgdesc="An classical puzzle game: Slide blocks to restore a picture.\n一个滑块拼图游戏, 采用前后台分离设计模式. 后台负责游戏规则实现和流程控制, 前台负责与用户交互. UI 开发者可以基于后台部分开发不同的用户界面."
arch=('x86_64')
url="https://gitee.com/tfcolin/slide"
license=('GPL-3.0-or-later')
depends=('gtk3' 'ncurses')
source=("https://github.com/tfcolin/slide/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('060a988fdd267a14d48d6fbb8fdba22957c8946e7043a0d95f5f2c070374b8ed')

build() {
	cd "slide-$pkgver"
	make
}

package() {
	cd "slide-$pkgver"
	PREFIX="$pkgdir/usr/" make install_all
}
