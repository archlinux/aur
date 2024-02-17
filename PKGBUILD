# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=makeenv
pkgver=1.0
pkgrel=1
pkgdesc='Run make(1) with environment loaded from .makeenv'
url='https://codeberg.org/maandree/makeenv'
arch=(any)
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(5556490f697cf1a38051d2da2e218f7b1c99d5262affe9f4e68aef483157e1255efdc3fe0001cf2c593d6248e8c9ab4a46e10bc5d7e999a7b9ffd1e05b5c0301)

build () {
	cd "$srcdir/makeenv"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/makeenv"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
