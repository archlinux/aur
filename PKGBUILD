# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libterminput
pkgver=1.0.2.1
pkgrel=1
pkgdesc="Terminal input parsing library"
arch=(x86_64)
url="https://codeberg.org/maandree/libterminput"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libterminput-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(fe6c9b73aed9bc355dddea19b6fca67c616fbf93da83201e83d9ef1f19cecf94)

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
