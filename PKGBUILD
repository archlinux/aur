# Maintainer: Mike Smith <mike@scgtrp.net>
pkgname=inkscape-gcodetools-git
pkgver=r317.ce38e8f
pkgrel=1
pkgdesc="CAM extension for Inkscape to export paths to Gcode"
depends=('inkscape')
arch=(any)
url="https://github.com/cnc-club/gcodetools"
license=('GPL')
source=('git+https://github.com/cnc-club/gcodetools.git')
sha512sums=('SKIP')

pkgver() {
	cd gcodetools
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd gcodetools
	install -m755 -Dt "$pkgdir/usr/share/inkscape/extensions" *.py
	install -m644 -Dt "$pkgdir/usr/share/inkscape/extensions" *.inx
}
