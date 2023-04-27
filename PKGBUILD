# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=animalcules
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Interactive microbiome analysis toolkit'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ape
  r-assertthat
  r-biomformat
  r-caret
  r-covr
  r-deseq2
  r-dplyr
  r-dt
  r-forcats
  r-ggplot2
  r-glmnet
  r-gunifrac
  r-limma
  r-magrittr
  r-multiassayexperiment
  r-plotly
  r-plotroc
  r-rentrez
  r-reshape2
  r-s4vectors
  r-scales
  r-shiny
  r-shinyjs
  r-summarizedexperiment
  r-tibble
  r-tsne
  r-umap
  r-vegan
  r-xml
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
  r-usethis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('27da24f27e8b78d11decef0f03a5ee6231453c47a4e22322426bc42fdaa586fc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
