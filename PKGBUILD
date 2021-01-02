# Maintainer: Thomas P. <tpxp@live.fr>
pkgname=tomboy-ng-bin
pkgver=0.31
_srcrel=0
pkgrel=1
pkgdesc="A complete rewriting of the Tomboy note taking app. GTK2 version"
arch=('x86_64')
license=('GPL-3.0')
url="https://wiki.gnome.org/Apps/Tomboy/tomboy-ng"
depends=(gtk2 libcanberra)
makedepends=()
optdepends=()
source=(
	"https://github.com/tomboy-notes/tomboy-ng/releases/download/v${pkgver}/tomboy-ng_${pkgver}-${_srcrel}_amd64.deb"
)
sha512sums=(
	3301565a089e575d42936b506d77ab9e222d5d2d3d7ac417e70c72a6a86541fd08928fc8e41af13b1cc469e012f6eaccd90a552ad23ad8d17c4c7340fe14af8c
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
