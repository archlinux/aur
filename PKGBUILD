# Maintainer: hanion <hanion@duck.com>
pkgname=mite
pkgver=1.1.0
pkgrel=2
pkgdesc="Static site generator with C templates"
arch=('x86_64')
url="https://github.com/hanion/mite"
license=('MIT')
source=("https://github.com/hanion/mite/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b87a541565eca685243e5ad4d262faf7f8403194b76c5fbc3d84159d2830509')

build() {
	cd "$srcdir/mite-$pkgver"
	cc -o mite mite.c
}

package() {
	cd "$srcdir/mite-$pkgver"
	install -Dm755 mite "$pkgdir/usr/bin/mite"
	install -Dm644 mite.c "$pkgdir/usr/share/mite/mite.c"
}

