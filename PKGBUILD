# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proBatch
_pkgver=1.13.0
pkgname=r-${_pkgname,,}
pkgver=1.13.0
pkgrel=1
pkgdesc='Tools for Diagnostics and Corrections of Batch Effects in Proteomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-corrplot
  r-data.table
  r-dplyr
  r-ggfortify
  r-ggplot2
  r-lazyeval
  r-lubridate
  r-magrittr
  r-pheatmap
  r-preprocesscore
  r-purrr
  r-pvca
  r-rcolorbrewer
  r-reshape2
  r-rlang
  r-scales
  r-sva
  r-tibble
  r-tidyr
  r-viridis
  r-wesanderson
  r-wgcna
)
optdepends=(
  r-devtools
  r-ggpubr
  r-gridextra
  r-gtable
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('33a9b8acb3215afb162a7dce1b2d753d7181141f7071fe520472f62fdfcaa5fc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
