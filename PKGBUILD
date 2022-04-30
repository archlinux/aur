# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=metR
_cranver=0.12.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for Easier Analysis of Meteorological Fields"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=2.10' r-checkmate r-data.table r-digest r-fields r-formula r-formula.tools 'r-ggplot2>=3.0.0' r-gtable r-lubridate r-memoise r-plyr r-scales r-sp r-stringr r-purrr r-rcurl r-isoband)
optdepends=(r-maps r-maptools r-covr r-irlba r-knitr r-ncdf4 r-pkgdown r-reshape2 r-rmarkdown r-testthat r-viridis r-udunits2 r-gridextra r-vdiffr r-proj4 r-kriging r-raster r-rgdal r-here)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=('db3bd9eb8b863ccfc90380ea981e30ed7dbcddd321e709f25eae0b5b72e95b3aa124160b56edc79f14f9c9f77bf808989396a4b1db7a54dac90e881db6ed41c1')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
