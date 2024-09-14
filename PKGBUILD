# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pcalg
_pkgver=2.7-12
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
md5sums=('0ee2db8805a10d2e3cb460f8d47ecba5')
b2sums=('2d59364818c74b54b99ea2e4cd5ca41168d9720516e7eeb70d24c9167f5cee75603d23576c6e55b52a746246306b2dcdb7641e30989f5dde42cda7b924f6f55a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
