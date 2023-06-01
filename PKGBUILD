# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=rgdal
_cranver=1.6-7
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
sha512sums=('a609bed99fae074d500035e2e461a9a70a11374276669523dae3a9afd23cde99c0e5742d2ac527b66d60a12b48b1ee1ae5922a5ca595f33b8ffe934e8933ffb0')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
