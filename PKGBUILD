# $Id: PKGBUILD 288774 2017-02-13 07:24:41Z arojas $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: trya <tryagainprod@gmail.com>

pkgname=quazip
pkgver=0.7.3
pkgrel=1
pkgdesc="C++ wrapper for the Gilles Vollant's ZIP/UNZIP C package"
url="http://sourceforge.net/projects/quazip/"
license=('LGPL')
arch=('i686' 'x86_64')
depends=(qt5-base)
makedepends=(cmake)
conflicts=('quazip-qt5')
provides=('quazip-qt5')
replaces=('quazip-qt5')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('2ba7dd8b1d6dd588374c9fab5c46e76e')

build() {
  mkdir -p build
  cd build
  
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_WITH_QT4:BOOL=OFF -DCMAKE_CXX_FLAGS="$CFLAGS -fPIC"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
