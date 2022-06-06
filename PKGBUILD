# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=weitrix
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Tools for matrices with precision weights, test and explore weighted or sparse data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-assertthat
  r-biocgenerics
  r-biocparallel
  r-ckmeans.1d.dp
  r-delayedarray
  r-delayedmatrixstats
  r-dplyr
  r-ggplot2
  r-glm2
  r-limma
  r-purrr
  r-reshape2
  r-rhpcblasctl
  r-rlang
  r-s4vectors
  r-scales
  r-summarizedexperiment
  r-topconfects
)
optdepends=(
  r-airway
  r-annotationdbi
  r-biocstyle
  r-complexheatmap
  r-edger
  r-ensdb.hsapiens.v86
  r-knitr
  r-org.sc.sgd.db
  r-patchwork
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('213ac96e9bcb6c8b452436e8f65ce8d5dbd8095fcb2aac76e65e9213e6807576')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
