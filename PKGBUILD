# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SIAMCAT
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=2.6.0
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
  r-lgr
  r-liblinear
  r-lmertest
  r-matrixstats
  r-mlr3
  r-mlr3learners
  r-mlr3tuning
  r-paradox
  r-phyloseq
  r-proc
  r-progress
  r-prroc
  r-rcolorbrewer
  r-scales
  r-stringr
)
optdepends=(
  r-biocstyle
  r-ggpubr
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7c1d0456a178517ce6b8f951ef9642556ef91501e095b23a6eb866d39ec4a026')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
