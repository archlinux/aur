# Maintainer: hanion <hanion@duck.com>
pkgname=mite
pkgver=1.3.0
pkgrel=1
pkgdesc="Static site generator with C templates"
arch=('x86_64')
url="https://github.com/hanion/mite"
license=('MIT')
source=("https://github.com/hanion/mite/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5bfc5bda1352fb9e0b5c7f0fd8171c33759fd8d1121d15076cf1071a5641b101')

build() {
	cd "$srcdir/mite-$pkgver"
	cc -o mite -O3 mite.c -static
}

package() {
	cd "$srcdir/mite-$pkgver"
	install -Dm755 mite "$pkgdir/usr/bin/mite"
	install -Dm644 mite.c "$pkgdir/usr/share/mite/mite.c"
}

