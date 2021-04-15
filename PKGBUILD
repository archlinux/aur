# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libcontacts
pkgver=1.0
pkgrel=1
pkgdesc="A library for handling a simple, flexible contact list"
arch=(x86_64)
url="https://github.com/maandree/libcontacts"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libcontacts-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(208696e963157ef48fe517a83904ff0e860d2a0c2be8455dd85be2b96bff71d0)

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
