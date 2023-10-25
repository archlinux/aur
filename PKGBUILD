# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sincell
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='R package for the statistical assessment of cell state hierarchies from single-cell RNA-seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-entropy
  r-fastica
  r-fields
  r-ggplot2
  r-igraph
  r-proxy
  r-rcpp
  r-reshape2
  r-rtsne
  r-scatterplot3d
  r-statmod
  r-tsp
)
optdepends=(
  r-biocstyle
  r-biomart
  r-knitr
  r-monocle
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('460c0fdd8f97dd266bac81b80af04f8605c14290cd939db90a7f242d3bd3a02a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
