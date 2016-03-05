# Maintainer: Barnaby Gray <barnaby@pickle.me.uk>
pkgname=cli53
pkgver=0.7.0
pkgrel=1
pkgdesc="Command line tool for Amazon Route 53"
arch=('i686' 'x86_64')
license=('BSD')
depends=()
makedepends=('go')
source=("https://github.com/barnybug/cli53/archive/$pkgver.tar.gz")
sha256sums=('87233f01795194e87a0f906309e273ca1e38e2313b2272c5bef27eb905543d99')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go build -ldflags "-X github.com/barnybug/cli53.version=$pkgver" ./cmd/cli53
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -DT "cli53" "$pkgdir/usr/bin/cli53"
}
