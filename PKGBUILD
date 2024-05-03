# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TBSignatureProfiler
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Profile RNA-Seq Data Using TB Pathway Signatures'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-assign
  r-biocparallel
  r-complexheatmap
  r-deseq2
  r-dt
  r-edger
  r-gdata
  r-ggplot2
  r-gsva
  r-magrittr
  r-rcolorbrewer
  r-reshape2
  r-rlang
  r-rocit
  r-s4vectors
  r-singscore
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-caret
  r-circlize
  r-class
  r-covr
  r-dplyr
  r-e1071
  r-glmnet
  r-hgnchelper
  r-impute
  r-knitr
  r-lintr
  r-mass
  r-plyr
  r-proc
  r-randomforest
  r-rmarkdown
  r-shiny
  r-spelling
  r-sva
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f34a44de804cd0d90d95d6e6ef02f245e3c289e4d37415da31a89a6c794b4dee')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
