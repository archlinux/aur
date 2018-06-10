# Maintainer: Jooa <aur at (name) dot xyz>
pkgname=r-gdal
pkgver=1.3
pkgrel=1
_cranname=rgdal
_cranrel=2
_pkgfile=${_cranname}_${pkgver}-${_cranrel}.tar.gz
pkgdesc="Bindings for the Geospatial Data Abstraction Library"
url="https://cran.r-project.org/package=${_cranname}"
arch=('x86_64' 'i686')
license=('GPL2' 'GPL3')
depends=('gdal>=1.6.3' 'proj>=4.4.9' 'r>=3.3.0' 'r-sp>=1.1-0')
source=(https://cran.r-project.org/src/contrib/${_cranname}_${pkgver}-${_cranrel}.tar.gz)
sha256sums=('94adbce3310b218fe274ea7149b6034b39e2bdf7264c7815d3f3352a5f6c9a4e')

build() {
	R CMD INSTALL ${_pkgfile} -l ${srcdir}
}

package() {
	install -d ${pkgdir}/usr/lib/R/library
	cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
