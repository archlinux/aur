# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPONGE
_pkgver=1.18.1
pkgname=r-${_pkgname,,}
pkgver=1.18.1
pkgrel=1
pkgdesc='Sparse Partial Correlations On Gene Expression'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-data.table
  r-dorng
  r-expm
  r-foreach
  r-glmnet
  r-grbase
  r-igraph
  r-iterators
  r-logging
  r-ppcor
  r-tidyverse
  r-caret
  r-dplyr
  r-biomart
  r-randomforest
  r-ggridges
  r-cvms
  r-mirbaseconverter
  r-complexheatmap
  r-ggplot2
  r-metbrewer
  r-rlang
  r-tnet
  r-ggpubr
  r-stringr
  r-tidyr
)
optdepends=(
  r-bigmemory
  r-digest
  r-doparallel
  r-ggrepel
  r-gridextra
  r-knitr
  r-rmarkdown
  r-testthat
  r-visnetwork
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cd6a8c034b631213b9ea6ccc71644ad28c41c9897224748ee888edc60c493c1c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
