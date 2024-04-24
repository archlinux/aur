# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=investr
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Inverse Estimation/Calibration Functions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('35f482b245f8033f4168e87d4a02e898')
b2sums=('1ab183d2d42da6ddf801cfabadafce5c16d5ff16ceddb78542c31a71ce864fe27508514fc8a7e636cc218f8029cc14a86cf3924075e44d58ba8c1a87a84dcc97')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
