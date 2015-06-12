# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=opulus
pkgver=0.9
pkgrel=1
pkgdesc="A Petri net editor/simulator"
arch=("i686" "x86_64")
url="http://opulus.sourceforge.net/"
depends=("qt4" "graphviz")
makedepends=("cmake")
license=("GPL")
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=("655b754ac62b4dac8f4861ae9cf0af14")

build() {
  cd $srcdir/$pkgname-$pkgver
  cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr .
  sed -i "s/new MiniView()/new MiniView(MainWindow)/" gui/ui_mainwindow.h
#  cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr . 
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install
}
