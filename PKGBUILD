# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libsha2
pkgver=1.0
pkgrel=1
pkgdesc="SHA-2-family hashing library"
arch=(i686 x86_64)
url="https://github.com/maandree/libsha2"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libsha2-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(43259e2aa920abdcd8c9d15fd0cf35add27501d41637c2b5a01ab5b16c1d6716)

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
