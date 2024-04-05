# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPAtest
_pkgver=3.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Score Test and Meta-Analysis Based on Saddlepoint Approximation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4f4e924f56bf00483c5bc545494016b3')
b2sums=('b7e17b02e2c7eea262e49692ea9a59716e4fdd4dbad7b99caef8d054ee446e849b124b75951bad3a5a28132e1a087d97016dc871e2dedb26af006ceb67bfa757')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
