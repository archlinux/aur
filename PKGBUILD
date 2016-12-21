# Maintainer: Alexander Keller <contact@nycroth.com>
pkgname=wjt
pkgver=0.2
pkgrel=1
pkgdesc='wjt is a slider widget for X'
url='https://github.com/ianremmler/wjt'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'libxinerama' 'libxft' 'freetype2')
source=("${url}/archive/$pkgver.tar.gz")
md5sums=('6724dd97274c12e93555a5821b49039d')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  cp ../../config.h .
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
}
