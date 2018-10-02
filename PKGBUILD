# Maintainer: Jooa <aur at (name) dot xyz>
pkgname=r-move
pkgver=3.1.0
pkgrel=1
_cranname=move
_pkgfile=${_cranname}_${pkgver}.tar.gz
pkgdesc="Functions to access movebank movement data and tools to visualise movement data"
url="https://cran.r-project.org/package=${_cranname}"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('r>=2.15.0' 'r-rcpp' 'r-httr' 'r-memoise' 'r-xml2' 'r-sp' 'r-geosphere' 'r-raster>=2.4' 'r-gdal' )
makedepends=('gcc')
optdepends=('r-adehabitathr' 'r-adehabitatlt' 'r-circular' 'r-ggmap' 'r-mapproj' 'r-maptools' 'r-testthat')
source=(https://cran.r-project.org/src/contrib/${_pkgfile})
sha256sums=('3ffd365a0986fa79f3885a7f929b83751a721da62ece8a94275f5cc8af2ab038')

build() {
	R CMD INSTALL ${_pkgfile} -l ${srcdir}
}

package() {
	install -d ${pkgdir}/usr/lib/R/library
	cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
