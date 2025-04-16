# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sincell
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
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
sha256sums=('ecd5e79db38cc83d39ab1c1f9c1b74fbcb3f114163d54579d3dde7baaca57ef8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
