# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miaSim
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Microbiome Data Simulation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-desolve
  r-matrixgenerics
  r-powerlaw
  r-s4vectors
  r-summarizedexperiment
  r-treesummarizedexperiment
)
optdepends=(
  r-ape
  r-biocstyle
  r-cluster
  r-colourvalues
  r-doparallel
  r-dplyr
  r-foreach
  r-ggally
  r-ggplot2
  r-igraph
  r-knitr
  r-mia
  r-miaviz
  r-network
  r-philentropy
  r-reshape2
  r-rmarkdown
  r-sna
  r-testthat
  r-vegan
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8f4ccc56d9ad0b7b0696d1966b229f6cc98ea327ff6f59b8311a032a759e160b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
