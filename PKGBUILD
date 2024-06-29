# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=makeenv
pkgver=1.0.1
pkgrel=1
pkgdesc='Run make(1) with environment loaded from .makeenv'
url='https://codeberg.org/maandree/makeenv'
arch=(any)
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(9c2009ef3a57586dd811d0d4f2b93876c5c26fc95ae8d3c1fbab131accb59961721b6bc553407985473c6169a65e04d74d6e552f6a8fc8e6069b27f4addc0f49)

build () {
	cd "$srcdir/makeenv"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/makeenv"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
