# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=metR
_cranver=0.6.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for Easier Analysis of Meteorological Fields"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=2.10' r-checkmate r-data.table r-digest r-fields r-formula r-formula.tools 'r-ggplot2>=3.0.0' r-gtable r-lubridate r-memoise r-plyr r-scales r-sp r-stringr r-purrr)
optdepends=(r-maps r-maptools r-covr r-irlba r-knitr r-ncdf4 r-pkgdown r-reshape2 r-rmarkdown r-testthat r-viridis r-udunits2 r-gridextra r-vdiffr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('90d8adbbc71c1767de2fe5fb7f0db83e')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
