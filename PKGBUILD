# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scRepertoire
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='A toolkit for single-cell immune receptor profiling'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Apache')
depends=(
  r
  r-doparallel
  r-dplyr
  r-ggalluvial
  r-ggplot2
  r-ggraph
  r-igraph
  r-plyr
  r-powertcr
  r-reshape2
  r-rlang
  r-seuratobject
  r-singlecellexperiment
  r-stringdist
  r-stringr
  r-summarizedexperiment
  r-tidygraph
  r-vegan
)
optdepends=(
  r-biocstyle
  r-circlize
  r-knitr
  r-rmarkdown
  r-scales
  r-scater
  r-seurat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('14d7ef535e908b755ff430fb5b075243d74515bc4e74570a94ed15591d3f0019')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
