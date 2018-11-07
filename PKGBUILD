# Maintainer: Jooa <aur at (name) dot xyz>
pkgname=r-raster
pkgver=2.8
pkgrel=1
_cranname=raster
_cranrel=4
_pkgfile=${_cranname}_${pkgver}-${_cranrel}.tar.gz
pkgdesc="Reading, writing, manipulating, analyzing and modeling of gridded spatial data."
url="https://cran.r-project.org/package=${_cranname}"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('r>=3.0' 'r-sp>=1.2-0' 'r-rcpp')
optdepends=('r-gdal>=0.9' 'r-geos>=0.3' 'r-ncdf4' 'r-igraph' 'r-sf')
provides=('r-raster')
source=(https://cran.r-project.org/src/contrib/${_pkgfile})
sha256sums=('4ae7d25982cee248c1cf7ca2c633ed1f021a76cab32b0452e36d96daed77ec92')

build() {
	R CMD INSTALL ${_pkgfile} -l ${srcdir}
}

package() {
	install -d ${pkgdir}/usr/lib/R/library
	cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
