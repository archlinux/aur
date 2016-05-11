# Maintainer: Zdenek Janak <janak@physics.muni.cz>

pkgname=rawtran
pkgver=0.3.8
pkgrel=1
pkgdesc="RAW to FITS convertor"
arch=('i686' 'x86_64')
url="http://integral.physics.muni.cz/rawtran/"
license=('GPL2')
depends=('dcraw' 'cfitsio')
source=(ftp://integral.physics.muni.cz/pub/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('145950686d67544395bc1606a27d6973')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
