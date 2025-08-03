# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hiprompt-gtk
pkgver=0.9
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

sha256sums=('879bebb24ce66ff92ba28844efcbb39ae8bb514f745e2ea894ef7d8f72d69c15')
