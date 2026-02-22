# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libparsepcf
pkgver=2.0.1
pkgrel=1
pkgdesc="C library for interpreting PCF (Portable Compiled Format) font files"
arch=(x86_64)
url="https://codeberg.org/maandree/libparsepcf"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(678d821835a2bd77d751b3cf5ca390eb39fb2044286daf02edd1bb8359de77ef)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
