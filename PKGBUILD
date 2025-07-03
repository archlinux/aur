# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-gi
pkgver=r39.eac0271
pkgrel=1
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
source=("${pkgname}::git+https://git.sr.ht/~yerinalexey/hare-gi")

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}

sha256sums=('SKIP')
