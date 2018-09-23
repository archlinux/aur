# Maintainer: Jooa <aur at (name) dot xyz>
pkgname=r-sp
pkgver=1.3
pkgrel=1
_cranname=sp
_cranrel=1
_pkgfile=${_cranname}_${pkgver}-${_cranrel}.tar.gz
pkgdesc="Classes and Methods for Spatial Data"
url="https://cran.r-project.org/package=${_cranname}"
arch=('x86_64' 'i686')
license=('GPL2' 'GPL3')
depends=('r>=3.0')
optdepends=('r-gdal>=0.8' 'r-geos>=0.3' 'r-gstat' 'r-maptools' 'r-deldir' 'r-rcolorbrewer')
provides=('r-sp')
conflicts=('r-cran-sp')
source=(https://cran.r-project.org/src/contrib/${_pkgfile})
sha256sums=('57988b53ba8acc35f3912d62feba4b929a0f757c6b54080c623c5d805e0cb59f')

build() {
	R CMD INSTALL ${_pkgfile} -l ${srcdir}
}

package() {
	install -d ${pkgdir}/usr/lib/R/library
	cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
