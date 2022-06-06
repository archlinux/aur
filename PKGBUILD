# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pcalg
_pkgver=2.7-6
pkgname=r-${_pkgname,,}
pkgver=2.7.6
pkgrel=3
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
sha256sums=('93be0aa037dccd219a4ce298f23955b6fed434557c00736a0a5bf856026d0431')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
