# Maintainer: hanion <hanion@duck.com>
pkgname=mite
pkgver=1.0.0
pkgrel=1
pkgdesc="Static site generator with C templates"
arch=('x86_64')
url="https://github.com/hanion/mite"
license=('MIT')
source=("https://github.com/hanion/mite/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('779971286fe651e2dd8c2e1ce3344808cbf10686934f76d44a2f711170622f8e')

build() {
	cd "$srcdir/mite-$pkgver"
	cc -o mite mite.c
}

package() {
	cd "$srcdir/mite-$pkgver"
	install -Dm755 mite "$pkgdir/usr/bin/mite"
	install -Dm644 mite.c "$pkgdir/usr/share/mite/mite.c"
}

