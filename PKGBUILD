# Maintainer: Thomas P. <tpxp@live.fr>
pkgname=tomboy-ng-bin
pkgver=0.26
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
	0e4d0e8b934594ffdf319828856bf3b75f9b05178467527ddab8cb67cc2e0ac63d7830fb1c77c8bf4aa488bba688ab655570e107d3c1943e65f879df04fe6b53
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
