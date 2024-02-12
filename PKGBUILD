# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pcalg
_pkgver=2.7-11
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
md5sums=('4f6e7f843d71ecf79d78a9c9c85ed54d')
b2sums=('61791561719184e384746d43ffe459ed82cb6508a5c92937d1e205ab6735aa97440d2bb0ca27a847db255abbd966c91fb7df9ae960268d2fde3dbbf6b445d6e8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
