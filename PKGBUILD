# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dearseq
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Differential Expression Analysis for RNA-seq data through a robust variance component test'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-compquadform
  r-dplyr
  r-ggplot2
  r-magrittr
  r-matrixstats
  r-patchwork
  r-pbapply
  r-reshape2
  r-rlang
  r-scattermore
  r-statmod
  r-survey
  r-tibble
  r-viridislite
)
optdepends=(
  r-biobase
  r-biocmanager
  r-biocset
  r-covr
  r-deseq2
  r-edger
  r-geoquery
  r-gsa
  r-knitr
  r-limma
  r-readxl
  r-rmarkdown
  r-s4vectors
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('477849a98ee6498b7af515ad0ebf7e299ce1fb9ee2f71f4d85d7e97f0ae1bdd1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
