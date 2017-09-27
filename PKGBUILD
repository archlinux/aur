# Maintainer: Zdenek Janak <janak@physics.muni.cz>

pkgname=fitspng
pkgver=1.3
pkgrel=1
pkgdesc="FITS to PNG convertor"
arch=('i686' 'x86_64')
url="http://integral.physics.muni.cz/fitspng/"
license=('GPL3')
depends=('libpng' 'cfitsio')
source=(ftp://integral.physics.muni.cz/pub/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3642824991afd9af1d37b2e8fabc9bd7')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
