# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=rgdal
_cranver=1.6-5
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Bindings for the 'Geospatial' Data Abstraction Library"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.5.0' 'r-sp>=1.1.0' proj gdal)
optdepends=(r-knitr r-dbi r-rsqlite r-maptools r-mapview r-rmarkdown r-curl r-rgeos)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=('ee0e477af5cb2e4d3f746c28cfa9f0474769f40cc9947bbcce17930fc3d322fbea57503ecc1e66d8816e8a3bcd88d03b85219c31854f2a5f3cdb40c70d5e6e59')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
