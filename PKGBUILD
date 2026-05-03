# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libterminput
pkgver=1.1.1
pkgrel=1
pkgdesc="Terminal input parsing library"
arch=(x86_64 aarch64)
url="https://codeberg.org/maandree/libterminput"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(46158316ea5b2bd956016e68b476250586c0b12f8df1ef944a1c3f2d44f3dc9d)

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
