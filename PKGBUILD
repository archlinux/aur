# Maintainer: Jooa <aur at (name) dot xyz>
pkgname=r-gdal
pkgver=1.3
pkgrel=3
_cranname=rgdal
_cranrel=4
_pkgfile=${_cranname}_${pkgver}-${_cranrel}.tar.gz
pkgdesc="Bindings for the Geospatial Data Abstraction Library"
url="https://cran.r-project.org/package=${_cranname}"
arch=('x86_64' 'i686')
license=('GPL2' 'GPL3')
depends=('gdal>=1.11.4' 'proj>=4.8.0' 'r>=3.3.0' 'r-sp>=1.1-0')
source=(https://cran.r-project.org/src/contrib/${_cranname}_${pkgver}-${_cranrel}.tar.gz)
sha256sums=('9dab55eca80e9df4982ee91bfcddde8195187b41120a824e27e0732c4c2575da')

build() {
	R CMD INSTALL ${_pkgfile} -l ${srcdir}
}

package() {
	install -d ${pkgdir}/usr/lib/R/library
	cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
