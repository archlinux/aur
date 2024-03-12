# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnlearn
_pkgver=4.9.2
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
md5sums=('9bb72beab67578e9190e50b135fd36ca')
b2sums=('35cd077e1c524958136043a6895b1e3004270687fbe1a60be5d651a8803616ce4c682864518bff63c8ec8373024b3d688a045bbb648c0434b09becf577fdabca')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
