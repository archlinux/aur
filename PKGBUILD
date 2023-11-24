# Maintainer: Gregory G Danielson III <gregdan3@protonmail.com>

pkgname=ttf-unifont-csur
pkgver=15.1.04
pkgrel=2
pkgdesc="TrueType part of the GNU Unifont containing Michael Everson's ConScript Unicode Registry (CSUR) Private Use Area (PUA) glyphs"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('ttf-unifont')
url=https://unifoundry.com/unifont/index.html
source=(
	"http://unifoundry.com/pub/unifont/unifont-${pkgver}/unifont-${pkgver}.tar.gz"{,.sig}
)
sha512sums=('0f3727708ecd75304b2e5d069c5c26e8673a624bf33c4d723e082faf3b2d3b33c73bb9b621ba8e90ddb8e1085dc1527e26a4754dd81f4e5445d53d4dacfef0e4'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <com dot unifoundry at unifoundry>

build() {
	cd "${srcdir}/unifont-${pkgver}/font"
	make hex
	make csurttf
}

package() {
	cd "$srcdir"
	install -Dm644 "unifont-${pkgver}/font/compiled/unifont_csur-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/Unifont_CSUR.ttf"
}
