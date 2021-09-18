# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libterminput
pkgver=1.0.2
pkgrel=1
pkgdesc="Terminal input parsing library"
arch=(x86_64)
url="https://github.com/maandree/libterminput"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libterminput-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(692dd303e74323505d1376ae91b6dd10a0415f3170c1f5fb08fa0bf2067ca983)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
