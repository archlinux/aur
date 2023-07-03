# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libterminput
pkgver=1.0.3
pkgrel=1
pkgdesc="Terminal input parsing library"
arch=(x86_64)
url="https://codeberg.org/maandree/libterminput"
license=('ISC')
depends=()
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(474c52d37b9705b6c5c81d2f21aa0ac0c0989d4c5a37fec10c92f743789dcbbe)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname"
  make check
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
