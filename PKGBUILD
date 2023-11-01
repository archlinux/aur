# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=metR
_cranver=0.14.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for Easier Analysis of Meteorological Fields"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=2.10' r-checkmate r-data.table r-digest r-formula r-formula.tools 'r-ggplot2>=3.0.0' r-gtable r-memoise r-plyr r-scales r-sf r-stringr r-purrr r-isoband r-lubridate)
optdepends=(r-maps r-covr r-irlba r-knitr r-ncdf4 r-pkgdown r-reshape2 r-rmarkdown 'r-testthat>=2.1.0' r-viridis r-pcict r-gridextra r-vdiffr r-proj4 r-kriging r-terra r-here r-gsignal)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=('71ea2a337e0093c170e6f3aed2dd329ea783b2013fb350711640f4213371cf0727e809577c2e2238c98385518f29d8546c142ac40e2505e098eb10a6229d5d6f')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
