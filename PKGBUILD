# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libterminput
pkgver=1.0
pkgrel=2
pkgdesc="Terminal input parsing library"
arch=(x86_64)
url="https://github.com/maandree/libterminput"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libterminput-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(ec0d858d12e2e297f22710d2dba0a2459b2025da54f69c22c2366d52998776f0)

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
