# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ClassifyR
_pkgver=3.8.2
pkgname=r-${_pkgname,,}
pkgver=3.8.2
pkgrel=1
pkgdesc='A framework for cross-validated classification problems, with applications to differential variability and differential distribution testing'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-dplyr
  r-genefilter
  r-generics
  r-ggplot2
  r-ggpubr
  r-ggupset
  r-multiassayexperiment
  r-ranger
  r-reshape2
  r-rlang
  r-s4vectors
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-car
  r-class
  r-cowplot
  r-data.tree
  r-e1071
  r-edger
  r-ggnewscale
  r-glmnet
  r-gridextra
  r-gtable
  r-htmltools
  r-iranges
  r-knitr
  r-limma
  r-matrixmodels
  r-pamr
  r-parathyroidse
  r-poiclaclu
  r-randomforestsrc
  r-rmarkdown
  r-rmixmod
  r-robustbase
  r-scales
  r-xgboost
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5b7152b01dd7809fcf4a27930bae24eedb5803d3f32601848b2e5bab58a7e8dc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
