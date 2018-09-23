# Maintainer: Jooa <aur at (name) dot xyz>
pkgname=r-raster
pkgver=2.6
pkgrel=1
_cranname=raster
_cranrel=7
_pkgfile=${_cranname}_${pkgver}-${_cranrel}.tar.gz
pkgdesc="Reading, writing, manipulating, analyzing and modeling of gridded spatial data."
url="https://cran.r-project.org/package=${_cranname}"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('r>=3.0' 'r-sp>=1.2-0' 'r-rcpp')
optdepends=('r-gdal>=0.9' 'r-geos>=0.3' 'r-ncdf4' 'r-igraph' 'r-sf')
provides=('r-raster')
source=(https://cran.r-project.org/src/contrib/${_pkgfile})
sha256sums=('fb91804fd465a4a6d9d9858e29fd05f41a99b8efdcc5cf4370ea253b68e42b01')

build() {
	R CMD INSTALL ${_pkgfile} -l ${srcdir}
}

package() {
	install -d ${pkgdir}/usr/lib/R/library
	cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
