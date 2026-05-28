# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hiprompt-gtk
pkgver=0.10
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
source=("${pkgname}-${pkgver}::https://git.sr.ht/~sircmpwn/hiprompt-gtk/archive/$pkgver.tar.gz")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}

sha256sums=('8a8b960d86f481769e25205d3b27d707c32e1dc78843a5fa4a2abe198f4ed27a')
