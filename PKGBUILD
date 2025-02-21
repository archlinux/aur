# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libterminput
pkgver=1.1
pkgrel=1
pkgdesc="Terminal input parsing library"
arch=(x86_64)
url="https://codeberg.org/maandree/libterminput"
license=('ISC')
depends=()
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(1e2238d7b28695095762f618a51bf9e70407b092538179245ab88213a5f23f59)

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
