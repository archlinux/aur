# Maintainer: Zdenek Janak <janak@physics.muni.cz>

pkgname=rawtran
pkgver=0.3.3
pkgrel=1
pkgdesc="RAW to FITS convertor"
arch=('i686' 'x86_64')
url="http://integral.physics.muni.cz/rawtran/"
license=('GPL2')
depends=('dcraw' 'cfitsio')
source=(ftp://integral.physics.muni.cz/pub/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('a6466512054664c2b49063055426d6cc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
