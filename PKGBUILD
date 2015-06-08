# Maintainer: Stephan Friedrichs <deduktionstheorem at gmail dot com>

pkgname='simple-svg'
pkgver='1.0.0'
pkgrel='3'
pkgdesc='This library is a single file header-only C++ library for creating SVG files'
arch=('any')
url='http://code.google.com/p/simple-svg/'
license=('custom:BSD3')
source=("http://simple-svg.googlecode.com/files/simple_svg_${pkgver}.hpp")
sha256sums=('103e4d09294de700154e929caadd8fae66f5ca40099977c47ca5481e494d0740')
depends=()

build() {
	sed -n -e "6,29p" "${srcdir}/simple_svg_${pkgver}.hpp" > "${srcdir}/LICENSE"
}

package() {
	install -D -m644 "${srcdir}/simple_svg_${pkgver}.hpp" "${pkgdir}/usr/include/simple_svg.hpp"
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
