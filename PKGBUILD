# Maintainer: Benoit Brummer <trougnouf at gmail dot com>
pkgname='cgp-library'
pkgver=2.4
pkgrel=1
pkgdesc='Cross platform Cartesian Genetic Programming implementation designed to be simple to use whilst being highly extendable.'
url='http://www.cgplibrary.co.uk'
depends=()
makedepends=('gcc' 'make')
license=('GPL3')
arch=('i686' 'x86_64')
source=("${url}/CGP-Library-V${pkgver}.zip")
sha256sums=('cc7dcdd8ae64d564804763b95375648039d4a921ebc4d486a6a51a8b0d5bad5c')

build() {
	cd "${srcdir}"
	make so
}


package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/lib"
	mkdir "${pkgdir}/usr/include"
	cp libcgp.so "${pkgdir}/usr/lib"
	chmod 0755 "${pkgdir}/usr/lib/libcgp.so"
	cp src/cgp.h "${pkgdir}/usr/include/"
	install='cgp-library.install'
}
