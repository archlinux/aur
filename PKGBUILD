# Maintainer: Jooa <aur at (name) dot xyz>
pkgname=r-geosphere
pkgver=1.5
pkgrel=1
_cranname=geosphere
_cranrel=7
_pkgfile=${_cranname}_${pkgver}-${_cranrel}.tar.gz
pkgdesc="Spherical trigonometry for geographic applications."
url="https://cran.r-project.org/package=${_cranname}"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('r>=3.0' 'r-sp')
optdepends=('r-raster')
provides=('r-geosphere')
source=(https://cran.r-project.org/src/contrib/${_pkgfile})
sha256sums=('9d9b555e2d59a5ae174ae654652121f169fbc3e9cf66c2491bfbe0684b6dd8a0')

build() {
	R CMD INSTALL ${_pkgfile} -l ${srcdir}
}

package() {
	install -d ${pkgdir}/usr/lib/R/library
	cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
