# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnlearn
_pkgver=4.9.4
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
  r-rocr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7e15dbf6d409c3b96ba0fb7362c3b182')
b2sums=('8c5bde2c577d4ae318f590423d7456a8df697bb2d120b170d346acb29f3780099a4cb9c03930fd134bf704c0937c6c698913e30f4c18bd113811edd29d3fda26')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
