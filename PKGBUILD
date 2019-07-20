# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=yefm
pkgver=0.2
pkgrel=3
pkgdesc="Simple 2 panes file manager"
url="https://github.com/yede/yefm.git"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt5-base')
source=("https://gitlab.com/stefanhusmann/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('4b9313da92f009a70ffa2b05db578519f1066e13eb651bc33c92f7b62bf07835')

build() {
  cd $pkgname-$pkgver
  qmake-qt5 $pkgname.pro
  make 
}
package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="${pkgdir}" install
}

