# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-adwaita
pkgver=0.1.0
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
source=("${pkgname}-${pkgver}::https://git.sr.ht/~sircmpwn/hare-adwaita/archive/0.1.0.tar.gz")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}

sha256sums=('6fe9fa62cc840893fbac3f42111ecd4a53fff7a58aeb9246bfca9e5caa582133')
