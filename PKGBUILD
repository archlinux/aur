# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NADA
_pkgver=1.6-1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Nondetects and Data Analysis for Environmental Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ec8f3a8868ac4e55b174106702427067')
b2sums=('34837f11d38f89cfc6190d6088720314937a731d7b3c8410ddab75000cd1671d310f0bd741fdd99c14360b68bce68ca78e71b846501f17c52b0767445fc250d4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
