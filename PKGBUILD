# Maintainer: hanion <hanion@duck.com>
pkgname=mite
pkgver=1.2.0
pkgrel=1
pkgdesc="Static site generator with C templates"
arch=('x86_64')
url="https://github.com/hanion/mite"
license=('MIT')
source=("https://github.com/hanion/mite/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b19ea44d53ed07036ef7c2a35cedca76df09dbd676ea58670be9f1853722b6b')

build() {
	cd "$srcdir/mite-$pkgver"
	cc -o mite -O3 mite.c
}

package() {
	cd "$srcdir/mite-$pkgver"
	install -Dm755 mite "$pkgdir/usr/bin/mite"
	install -Dm644 mite.c "$pkgdir/usr/share/mite/mite.c"
}

