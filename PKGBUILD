# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=km.ci
_pkgver=0.5-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Confidence Intervals for the Kaplan-Meier Estimator"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('557066a7ceeca9074229b12c111c0e27')
b2sums=('49de997959eb291b9864b6b205639a2d6ac5f711a8672fd830a44d821863e9d98dedf7dc315a1f454ba833de2abf6d6f65344c77f0d118894f367abb12ee6cbd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
