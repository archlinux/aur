# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libterminput
pkgver=1.1.2
pkgrel=1
pkgdesc="Terminal input parsing library"
arch=(x86_64 aarch64)
url="https://codeberg.org/maandree/libterminput"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(8214a607b9c81cbded96774b5ac0f85563247e1fe8b8eec34699ba03866feaaa)

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
