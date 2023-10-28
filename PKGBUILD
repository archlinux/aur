# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TSCAN
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Tools for Single-Cell Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-combinat
  r-delayedarray
  r-fastica
  r-ggplot2
  r-gplots
  r-igraph
  r-mclust
  r-plyr
  r-s4vectors
  r-shiny
  r-singlecellexperiment
  r-summarizedexperiment
  r-trajectoryutils
)
optdepends=(
  r-batchelor
  r-biocneighbors
  r-biocparallel
  r-knitr
  r-metapod
  r-scran
  r-scuttle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('91de32a9438713559f766018096c5a9b7b6f65cb4e1e6640484a2699be5fa352')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
