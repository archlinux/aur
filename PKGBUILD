# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CATALYST
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Cytometry dATa anALYSis Tools'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-circlize
  r-complexheatmap
  r-consensusclusterplus
  r-cowplot
  r-data.table
  r-dplyr
  r-drc
  r-flowcore
  r-flowsom
  r-ggplot2
  r-ggrepel
  r-ggridges
  r-gridextra
  r-magrittr
  r-matrixstats
  r-nnls
  r-purrr
  r-rcolorbrewer
  r-reshape2
  r-rtsne
  r-s4vectors
  r-scales
  r-scater
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-diffcyt
  r-flowworkspace
  r-ggcyto
  r-knitr
  r-opencyto
  r-rmarkdown
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ea2b16a2665db1a2c31400f759724946d11be26e3e0b40e640be9efd2c06d038')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
