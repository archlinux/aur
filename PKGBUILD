# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Doscheda
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='A DownStream Chemo-Proteomics Analysis Pipeline'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-calibrate
  r-corrgram
  r-drc
  r-dt
  r-ggplot2
  r-gridextra
  r-httr
  r-jsonlite
  r-limma
  r-matrixstats
  r-prodlim
  r-readxl
  r-reshape2
  r-shiny
  r-shinydashboard
  r-stringr
  r-vsn
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('817e2b35423b020959fca253b2986b0ac0a9c4de9ad42fb882a764921781b8c1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
