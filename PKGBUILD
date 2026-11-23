# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppZiggurat
_pkgver=0.1.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'Rcpp' Integration of Different \"Ziggurat\" Normal RNG Implementations"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  gsl
  r-rcpp
)
makedepends=(
  r-rcppgsl
)
optdepends=(
  r-microbenchmark
  r-rbenchmark
  r-ggplot2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f6eccdaa8c475bb0e71750ae6de8cc56')
b2sums=('d7411e6672a30fde16099fbe9bf1936533c6ddd3523502fd1637ad5b99afafe2cc04e9c475b04a5b8a3c24fff0fe8debb91dd6f7f1718aa4c402c8f02f08f3e2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
