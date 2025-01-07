# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnlearn
_pkgver=5.0.2
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
md5sums=('69c70ea271eaca3162396059e22bdc4b')
b2sums=('45377d687c42315bf97b574c5615e80493cff7b778c000476797df8031e25521f869fadddef1bcf5535db641d92196c75e7e61b75aed40761917792880e2d0ac')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
