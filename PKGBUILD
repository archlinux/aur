# Maintainer: Zdenek Janak <janak@physics.muni.cz>

pkgname=fitspng
pkgver=0.3.5
pkgrel=1
pkgdesc="FITS to PNG convertor"
arch=('i686' 'x86_64')
url="http://integral.physics.muni.cz/fitspng/"
license=('GPL3')
depends=('libpng' 'cfitsio')
source=(ftp://integral.physics.muni.cz/pub/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('9e56912e06376602c89083d240921c2b')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
