# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnlearn
_pkgver=5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bayesian Network Structure Learning, Parameter Learning and Inference"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r
)
optdepends=(
  r-gmp
  r-grain
  r-graph
  r-grbase
  r-igraph
  r-rgraphviz
  r-rmpfr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f3347400883a69b732fafe28464b458')
b2sums=('69cd64af0b29c0b3da1e61daf3215c8d1484caf73186ce26d3522b887f63e97ea8aa73447a7e76f2348b1726e0387c6d44a9328caaab45a313f081b917433d90')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
