# Maintainer: Thomas P. <tpxp@live.fr>
pkgname=tomboy-ng-bin
pkgver=0.33
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
	094b6937a15f8e94bb57b2b02c8980f29386eea9f2f64040fb2a0370448378288d489327ec4728da5d094ea739c0fc5f3dd61fe88c3546d0fa6b197cdf3817fa
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
