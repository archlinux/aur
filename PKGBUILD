# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flexclust
_pkgver=1.4-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Flexible Cluster Algorithms"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-modeltools
)
optdepends=(
  r-clue
  r-ellipse
  r-seriation
  r-skmeans
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('26881cc4609085245e8e3f401a27083f')
b2sums=('bfde267137b7b7ece944efb3ec1f52def87344b6fc67ab4e3271c4d94e7d178f27ed2b2b7b97e138b55bff10d560f08531ce9976066d9fcf83667409e284e83f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
