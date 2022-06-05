# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dearseq
_pkgver=1.8.1
pkgname=r-${_pkgname,,}
pkgver=1.8.1
pkgrel=1
pkgdesc='Differential Expression Analysis for RNA-seq data through a robust variance component test'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-matrixstats
  r-patchwork
  r-pbapply
  r-statmod
  r-survey
  r-viridislite
  r-compquadform
  r-reshape2
  r-plyr
  r-dplyr
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
sha256sums=('415e466e09d170fb67e87ca0c8e66a21cd1dabc83a2e4dadae8c32fdca2424b8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
