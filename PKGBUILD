# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Jooa <aur at (name) dot xyz>

pkgname=r-gdal
pkgver=1.4
pkgrel=2
_cranname=rgdal
_cranrel=8
_pkgfile=${_cranname}_${pkgver}-${_cranrel}.tar.gz
pkgdesc="Bindings for the 'Geospatial' Data Abstraction Library"
url="https://cran.r-project.org/package=${_cranname}"
arch=('x86_64' 'i686')
license=('GPL2' 'GPL3')
depends=('gdal>=1.11.4' 'proj>=4.8.0' 'r>=3.5.0' 'r-sp>=1.1-0')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${pkgver}-${_cranrel}.tar.gz")
sha256sums=('5a0da53aedc9e1fc2ca9e5d04b6711d36c43e17e25d458b0fdf00d575548a6c9')

build() {
	R CMD INSTALL ${_pkgfile} -l ${srcdir}
}

package() {
	install -d ${pkgdir}/usr/lib/R/library
	cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
