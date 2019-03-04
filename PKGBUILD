# Maintainer: Zdenek Janak <janak@physics.muni.cz>

pkgname=rawtran
pkgver=1.1
pkgrel=1
pkgdesc="RAW to FITS convertor"
arch=('i686' 'x86_64')
url="http://integral.physics.muni.cz/rawtran/"
license=('GPL2')
depends=('dcraw' 'cfitsio')
source=(ftp://integral.physics.muni.cz/pub/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('e8c49f0b3b19b07b10468c1d9f14932f')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
