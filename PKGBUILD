# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=bfind
pkgver=3.0.1
pkgrel=1
pkgdesc="find alternative optimised for finding files rather then listing files"
url="https://github.com/maandree/bfind"
arch=(any)
license=(custom:ISC)
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(b5f44e57464debaeb48f3df38ac26468d6fdee3ef53f5c79e3367b94e1b6ae5d)


build() {
	cd "$srcdir/bfind-$pkgver"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/bfind-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
