# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hiprompt-gtk-git
_pkgname=hiprompt-gtk
pkgver=r28.4f4c1fd
pkgrel=1
license=("GPL3")
pkgdesc=" GTK4 prompter for Himitsu "
makedepends=(
	"git"
	"hare"
	"hare-gi"
	"hare-adwaita"
	"hare-gtk4-layer-shell"
)

depends=(
	"himitsu"
)

arch=("x86_64" "aarch64")
url="https://git.sr.ht/~sircmpwn/hiprompt-gtk"
source=("${_pkgname}::git+https://git.sr.ht/~sircmpwn/hiprompt-gtk")

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
