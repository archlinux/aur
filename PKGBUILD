# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pcalg
_pkgver=2.7-10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Methods for Graphical Models and Causal Inference"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r-abind
  r-bdsmatrix
  r-clue
  r-corpcor
  r-fastica
  r-ggm
  r-graph
  r-igraph
  r-rbgl
  r-rcpp
  r-robustbase
  r-sfsmisc
  r-vcd
)
makedepends=(
  r-bh
  r-rcpparmadillo
)
optdepends=(
  r-dagitty
  r-ggplot2
  r-huge
  r-mvtnorm
  r-rgraphviz
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4675c89a2e090467cc7d7e5d626cdf57')
b2sums=('da10cb7cae16f0b97d44fcb3fd4455473f2a974ef281e2d02dcc7de6a333a3474ef6deadcbe14945414e3fa785f44db4126a209b18650d6fee4da52494f4dcf6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
