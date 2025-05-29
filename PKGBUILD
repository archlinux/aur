# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppDate
_pkgver=0.0.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'date' C++ Header Library for Date and Time Functionality"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3151aaed933e8ad02e74afb6e61c878d')
b2sums=('0c42ac2feb765f31eb37d9846cda62cb5d62b226e6f27ea7ac57d96d011222fff8c80978517fe567178ab148ac8035f8b599587848c757f2fe6ec98d276ea2e3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
