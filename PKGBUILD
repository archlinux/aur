# Maintainer: hanion <hanion@duck.com>
pkgname=mite
pkgver=1.4.1
pkgrel=1
pkgdesc="Static site generator with C templates"
arch=('x86_64')
url="https://github.com/hanion/mite"
license=('MIT')
source=("https://github.com/hanion/mite/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('40727df3d1d405749208078b472695218ef8d43dd3344a4480ec77f7dfdbbaee')

build() {
	cd "$srcdir/mite-$pkgver"
	cc -o mite -O3 mite.c -static
}

package() {
	cd "$srcdir/mite-$pkgver"
	install -Dm755 mite "$pkgdir/usr/bin/mite"
	install -Dm644 mite.c "$pkgdir/usr/share/mite/mite.c"
}

