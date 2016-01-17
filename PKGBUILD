# Maintainer: Barnaby Gray <barnaby@pickle.me.uk>
pkgname=cli53
pkgver=0.6.8
pkgrel=1
pkgdesc="Command line tool for Amazon Route 53"
arch=('i686' 'x86_64')
license=('BSD')
depends=()
makedepends=('go')
source=("https://github.com/barnybug/cli53/archive/0.6.8.tar.gz")
md5sums=('10300a3d63336df0fa7e12b988761fcc')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go build -ldflags "-X github.com/barnybug/cli53.version=$pkgver" ./cmd/cli53
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -DT "cli53" "$pkgdir/usr/bin/cli53"
}
