# Maintainer: Zdenek Janak <janak@physics.muni.cz>

pkgname=fitspng
pkgver=0.3.4
pkgrel=1
pkgdesc="FITS to PNG convertor"
arch=('i686' 'x86_64')
url="http://integral.physics.muni.cz/fitspng/"
license=('GPL3')
depends=('libpng>=1.4.0' 'cfitsio')
source=(ftp://integral.physics.muni.cz/pub/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d2dca46ee675f1f8185d2822b19b3d83')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr CFLAGS=-lm
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
