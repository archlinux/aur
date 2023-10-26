# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffuStats
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Diffusion scores on biological networks'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-checkmate
  r-expm
  r-igraph
  r-plyr
  r-precrec
  r-rcpp
  r-rcpparmadillo
  r-rcppparallel
  make
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-ggsci
  r-igraphdata
  r-knitr
  r-reshape2
  r-rmarkdown
  r-testthat
  r-utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3ec742621089d9e8ad6607b9e99741148d978d9b998c31c2949b1d7228bada5f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
