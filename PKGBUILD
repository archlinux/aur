# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SIAMCAT
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=2.2.0
pkgrel=1
pkgdesc='Statistical Inference of Associations between Microbial Communities And host phenoTypes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-beanplot
  r-corrplot
  r-glmnet
  r-gridbase
  r-gridextra
  r-infotheo
  r-liblinear
  r-matrixstats
  r-mlr
  r-paramhelpers
  r-phyloseq
  r-proc
  r-progress
  r-prroc
  r-rcolorbrewer
  r-scales
  r-stringr
  r-mlr3
  r-lmertest
  r-mlr3learners
  r-mlr3tuning
  r-paradox
  r-lgr
)
optdepends=(
  r-biocstyle
  r-ggpubr
  r-knitr
  r-optparse
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('936f5b0a7986e8e14d8ccae5880262e4b88da1add67b6cdc29e061c57329a3bb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
