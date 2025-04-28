# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hipathia
_pkgver=3.8.0
pkgname=r-${_pkgname,,}
pkgver=3.8.0
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
sha256sums=('e05bbe3bfab5a6d1ab49515c23603fcf1535e89222779c8b2f3dacd7d95ff452')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
