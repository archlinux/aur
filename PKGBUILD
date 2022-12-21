# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pcalg
_pkgver=2.7-8
pkgname=r-${_pkgname,,}
pkgver=2.7.8
pkgrel=1
pkgdesc='Methods for Graphical Models and Causal Inference'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-bdsmatrix
  r-bh
  r-clue
  r-corpcor
  r-fastica
  r-ggm
  r-graph
  r-igraph
  r-rbgl
  r-rcpp
  r-rcpparmadillo
  r-robustbase
  r-sfsmisc
  r-vcd
)
optdepends=(
  r-dagitty
  r-ggplot2
  r-huge
  r-mass
  r-matrix
  r-mvtnorm
  r-rgraphviz
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7922f54db964511b6b07d7ffa86ea9f3f1b599c0609c47d194a5065615f312de')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
