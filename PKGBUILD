# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=deming
_pkgver=1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Deming, Theil-Sen, Passing-Bablock and Total Least Squares Regression"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d63daf672291763deca4518eb39f7be2')
b2sums=('8958dac958762112a0fa36976aada09df369650f351a1969f34dd6655fd07eb7680904f9e2c30c134769e307da2a4e6d111b6367ea3916e2c85c9fc6060ebc5a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
