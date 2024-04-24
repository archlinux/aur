# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tweedie
_pkgver=2.3.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Evaluation of Tweedie Exponential Family Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-stabledist
  r-statmod
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b4048e492744c22b39c9ca631e1c1b81')
b2sums=('c82354103d5ed4940bf382731e7a9c27a7070c0ce6ea50eabbf8887daf477cdcc8e3e5e9bcf92b5cf3415221abe51a14d591796d270801eea6c4fa6aee7e3c45')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
