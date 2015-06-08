# Maintainer: trya <tryagainprod@gmail.com>

pkgname=quazip-qt5
pkgver=0.7.1
pkgrel=1
pkgdesc="C++ wrapper for the Gilles Vollant's ZIP/UNZIP C package (Qt5 library)"
url="http://sourceforge.net/projects/quazip/"
arch=('i686' 'x86_64')
depends=('qt5-base')
conflicts=('quazip')
source=("http://downloads.sourceforge.net/project/quazip/quazip/$pkgver/quazip-$pkgver.tar.gz")
license=('LGPL')
md5sums=('3b99effb2a9417707d463e6f19cf2629')

build() {
  cd "$srcdir/quazip-$pkgver/quazip"
  qmake-qt5 PREFIX="$pkgdir/usr"
  make
}

package() {
  cd "$srcdir/quazip-$pkgver/quazip"
  make install
  install -Dm644 ../FindQuaZip.cmake \
    "$pkgdir/usr/share/cmake-3.0/Modules/FindQuaZip.cmake"
}
