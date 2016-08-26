# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=acmetool
pkgver=0.0.56
pkgrel=1
pkgdesc="Acmetool is an easy-to-use command line tool for automatically acquiring certificates from ACME servers (such as Let's Encrypt)"
arch=(i686 x86_64 armv7h)
url="https://github.com/hlandau/acme"
license=('MIT')
depends=()
makedepends=(go)

build() {
	GOPATH="$srcdir" go get -v -x github.com/hlandau/acme/cmd/acmetool
}

package() {
	install -Dm755 "$srcdir/bin/acmetool" "$pkgdir/usr/bin/acmetool"
}
