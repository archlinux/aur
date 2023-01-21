# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=COMPASS
_pkgver=1.36.2
pkgname=r-${_pkgname,,}
pkgver=1.36.2
pkgrel=1
pkgdesc='Combinatorial Polyfunctionality Analysis of Single Cells'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-abind
  r-biocstyle
  r-clue
  r-coda
  r-data.table
  r-dplyr
  r-foreach
  r-knitr
  r-magrittr
  r-pdist
  r-plyr
  r-rcolorbrewer
  r-rcpp
  r-reshape2
  r-rlang
  r-rmarkdown
  r-scales
  r-tidyr
)
optdepends=(
  r-devtools
  r-flowcore
  r-flowworkspace
  r-flowworkspacedata
  r-ggplot2
  r-ncdfflow
  r-progress
  r-shiny
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6647abc0107649accc0c2453ec1a827cabc9f9152ce412cebdd362afb8eb5f2f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
