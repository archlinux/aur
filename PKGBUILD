# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=acmetool-git
pkgver=20151206
pkgrel=1
pkgdesc=""
arch=(i686 x86_64)
url="https://github.com/hlandau/acme"
license=('MIT')
depends=()
makedepends=(git go)

pkgver() {
	date +%Y%m%d
}

build() {
	GOPATH="$srcdir" go get -v -x github.com/hlandau/acme/cmd/acmetool
}

package() {
	install -Dm755 "$srcdir/bin/acmetool" "$pkgdir/usr/bin/acmetool"
}
