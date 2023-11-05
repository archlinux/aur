# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proBatch
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=3
pkgdesc='Tools for Diagnostics and Corrections of Batch Effects in Proteomics'
arch=('any')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
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
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('32705297e21273d3910f4c07d5b7aa64c49783d5c6ea02b356bab6b083812d1d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
