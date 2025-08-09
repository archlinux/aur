# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-gi
pkgver=0.1.0
pkgrel=2
license=("MPL2")
pkgdesc="GObject Introspection code generator for Hare"
makedepends=(
	"git"
)

depends=(
	"hare"
	"gtk3"
	"gtk4"
	"gobject-introspection"
)

arch=("x86_64" "aarch64")
url="https://git.sr.ht/~yerinalexey/hare-gi"
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~yerinalexey/hare-gi/archive/${pkgver}.tar.gz")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}

sha256sums=('3d70fde77c07be396d5e7cfc1344e72a3fb4b1ce8a58eeb938bd792c6a1a452e')
