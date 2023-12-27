# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparsebnUtils
_pkgver=0.0.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Utilities for Learning Sparse Bayesian Networks"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
optdepends=(
  r-bnlearn
  r-graph
  r-igraph
  r-network
  r-rcy3
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1517d36ea36652702bd7b113b0b776b6')
b2sums=('1aa8d00b9797fb30e51b163df73acafee5650e59d7665d5f6676c58a5764dfa10e851fbc0111f9138a13146b6134918c1c17034bb8b7ffe2779d2f82ba7d3f83')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
