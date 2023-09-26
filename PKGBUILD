# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pcalg
_pkgver=2.7-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Methods for Graphical Models and Causal Inference"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
md5sums=('a04f0500d81148d2265f1f76d7f220e9')
sha256sums=('b8b1d292e79a9bb495d195b730f99e1dc5a6686c39fb98fc1574982e882c1116')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
