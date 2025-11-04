# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Doscheda
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
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
sha256sums=('767d4ba81fc1b9235b6c64e5c23f22375f7dadf90d73891385c09c04f1c49436')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
