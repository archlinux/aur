# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pcalg
_pkgver=2.7-9
pkgname=r-${_pkgname,,}
pkgver=2.7.9
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
sha256sums=('b8b1d292e79a9bb495d195b730f99e1dc5a6686c39fb98fc1574982e882c1116')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
