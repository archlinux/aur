# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3measures
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Performance Measures for 'mlr3'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-checkmate
  r-mlr3misc
  r-prroc
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7b6e79358e173fa54c97c751c71b92ff')
b2sums=('03a5633d68a9c05dbef31b05b9313f276b50bbe571abd8f63fd979cad8e5275bbd3e6665ef04ae635a40a7255778908ac539885bd6fa3556ab6876557c607464')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
