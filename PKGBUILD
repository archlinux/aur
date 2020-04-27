# Maintainer: Thomas P. <tpxp@live.fr>
pkgname=tomboy-ng-bin
pkgver=0.27
pkgrel=0
pkgdesc="A complete rewriting of the Tomboy note taking app"
arch=('x86_64')
license=('GPL-3.0')
url="https://wiki.gnome.org/Apps/Tomboy/tomboy-ng"
depends=(gtk2 libcanberra)
makedepends=()
optdepends=()
source=(
	"https://github.com/tomboy-notes/tomboy-ng/releases/download/v${pkgver}/tomboy-ng_${pkgver}-${pkgrel}_amd64.deb"
)
sha512sums=(
	9223d56fedb374202e198e8ea90a431fcb31da4d3878bbdd5f929f33cff5782861ed5403ba0b285e1abc8f9cda295842985232d7f59f5cb398462e56dc445420
)

package() {
	_src="$srcdir/$pkgname"
	mkdir -p "$_src"
	cd $_src
	tar xf "$srcdir/data.tar.xz"

	mkdir -p "$pkgdir/usr/share"
	for dir in man applications icons; do
		cp -r "usr/share/$dir" "$pkgdir/usr/share"
	done

	install -Dm755 "usr/bin/tomboy-ng" "$pkgdir/usr/bin/tomboy-ng"
}
