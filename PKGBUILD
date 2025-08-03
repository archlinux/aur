# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-gtk4-layer-shell
pkgver=0.1.0
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
source=("${pkgname}-$pkgver::https://git.sr.ht/~sircmpwn/hare-gtk4-layer-shell/archive/0.1.0.tar.gz")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}

sha256sums=('0264500c71b716483bb9dd8c26f979bdabec01d46d988b329eaeb1f93c4a9d41')
