# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=bfind
pkgver=3.0
pkgrel=1
pkgdesc="find alternative optimised for finding files rather then listing files"
url="https://github.com/maandree/bfind"
arch=(any)
license=(custom:ISC)
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(d50ac7dd28829e4ae7e5c0ad5509ca2036f87207f898e2b6cd97fa1735ae0104)


build() {
	cd "$srcdir/bfind-$pkgver"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/bfind-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
