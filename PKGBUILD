# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DaMiRseq
_pkgver=2.16.0
pkgname=r-${_pkgname,,}
pkgver=2.16.0
pkgrel=1
pkgdesc='Data Mining for RNA-seq data: normalization, feature selection and classification'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-arm
  r-caret
  r-corrplot
  r-deseq2
  r-e1071
  r-edaseq
  r-edger
  r-factominer
  r-fselector
  r-ggplot2
  r-hmisc
  r-ineq
  r-kknn
  r-limma
  r-lubridate
  r-pheatmap
  r-pls
  r-plsvarsel
  r-plyr
  r-randomforest
  r-rcolorbrewer
  r-reshape2
  r-rsnns
  r-summarizedexperiment
  r-sva
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('21509c018182d5918c31802a3e29d0b8d32dadd4c6f3c791034528b8e46c3109')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
