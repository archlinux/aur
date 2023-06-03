# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hipathia
_pkgver=3.0.1
pkgname=r-${_pkgname,,}
pkgver=3.0.1
pkgrel=1
pkgdesc='HiPathia: High-throughput Pathway Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationhub
  r-coin
  r-delayedarray
  r-dplyr
  r-ggplot2
  r-ggpubr
  r-igraph
  r-limma
  r-matrixstats
  r-metbrewer
  r-multiassayexperiment
  r-preprocesscore
  r-reshape2
  r-s4vectors
  r-servr
  r-summarizedexperiment
  r-tibble
  r-visnetwork
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0964c477586700fd9f72ad73b3be883180643fb191cb6bd8d36a2c5ef68d2077')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
