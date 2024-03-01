# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnlearn
_pkgver=4.9.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('635e44be0c40c2e924118674ef1e9ec6')
b2sums=('2c4eded116fe386d1fa0d66209be0a2d3c298e4c33b3364ccaacc8dd74940e6ba908e62777927ab04337a99223b765b326450f37523db101ca8bafa1ad98017a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
