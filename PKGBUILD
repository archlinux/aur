# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=rgdal
_cranver=1.5-31
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
sha512sums=('2380c2ad9ece4e63e133eea9bcf2984e32f175a87c228689e691ec0978d53950a7c9dd779b992872f041fef42cb57ddf2327f848be3f3d8c0495a4cf48719267')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
