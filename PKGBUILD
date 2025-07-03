# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-adwaita-git
_pkgname=hare-adwaita
pkgver=r1.995ebdf
pkgrel=1
license=("MPL2")
pkgdesc="Hare bindings for libadwaita"
provides=("hare-adwaita")
makedepends=(
	"git"
)

depends=(
	"hare"
	"hare-gi"
	"libadwaita"
)

arch=("x86_64" "aarch64")
url="https://git.sr.ht/~sircmpwn/hare-adwaita"
source=("${_pkgname}::git+https://git.sr.ht/~sircmpwn/hare-adwaita")

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
