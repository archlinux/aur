# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-gtk4-layer-shell-git
_pkgname=hare-gtk4-layer-shell
pkgver=r1.dd7dd93
pkgrel=1
license=("MPL2")
pkgdesc="Hare bindings for libgtk4-layer-shell"
provides=("hare-gtk4-layer-shell")
makedepends=(
	"git"
)

depends=(
	"hare"
	"hare-gi"
	"gtk4-layer-shell"
)

arch=("x86_64" "aarch64")
url="https://git.sr.ht/~sircmpwn/hare-gtk4-layer-shell"
source=("${_pkgname}::git+https://git.sr.ht/~sircmpwn/hare-gtk4-layer-shell")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}

sha256sums=('SKIP')
