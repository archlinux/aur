# Maintainer: Barnaby Gray <barnaby@pickle.me.uk>
pkgname=cli53
pkgver=0.6.7
pkgrel=1
pkgdesc="Command line tool for Amazon Route 53"
arch=('i686' 'x86_64')
license=('BSD')
depends=()
makedepends=('go')
source=("https://github.com/barnybug/cli53/archive/0.6.7.tar.gz")
md5sums=('0093e16b85dd166dd02ffd9c404b4d16')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go build -ldflags "-X github.com/barnybug/cli53.version=$pkgver" ./cmd/cli53
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -DT "cli53" "$pkgdir/usr/bin/cli53"
}
