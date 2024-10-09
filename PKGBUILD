# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libcontacts
pkgver=1.0.1
pkgrel=1
pkgdesc="A library for handling a simple, flexible contact list"
arch=(x86_64)
url="https://codeberg.org/maandree/libcontacts"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(44949f6b8e89176fb9a7c6910f0e6cb4aa8d00d8da03b6d172f78d9c86ed8a50)

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
