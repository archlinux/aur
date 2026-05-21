# Maintainer: Gregory G Danielson III <gregdan3@protonmail.com>

pkgname=ttf-unifont-csur
pkgver=17.0.04
pkgrel=1
pkgdesc="TrueType part of the GNU Unifont containing Michael Everson's ConScript Unicode Registry (CSUR) Private Use Area (PUA) glyphs"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('ttf-unifont')
makedepends=('fontforge')
url=https://unifoundry.com/unifont/index.html
source=(
	"http://unifoundry.com/pub/unifont/unifont-${pkgver}/unifont-${pkgver}.tar.gz"{,.sig}
)
sha512sums=('6cfec28f5322290002ab4b304e5f7fd78e56802dac89704c64bf5be725307d7abefd8ce1b4d07eb9a1d217a359128281e51c97f8da4e9000db64c5f0cf05d60d'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <com dot unifoundry at unifoundry>

build() {
	cd "${srcdir}/unifont-${pkgver}/font"
	make hex
	make ttf-csur
}

package() {
	cd "$srcdir"
	install -Dm644 "unifont-${pkgver}/font/compiled/unifont_csur-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/Unifont_CSUR.ttf"
}
