# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=python-bus
pkgver=3.1.5
pkgrel=1
pkgdesc="Python 3 module for bus"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/python-bus"
license=('custom:ISC')
depends=(bus python)
makedepends=(cython)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(749dbef6f09424469879ff966a0ed9189f4d5b1a779f85e6101bcd78e730d25f)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
