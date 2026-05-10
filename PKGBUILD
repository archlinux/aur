# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.utils
_pkgver=3.2-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utility Functions for 'spatstat'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-spatstat.model
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d03d6d140bffb15172320deaeeede931')
b2sums=('0026704f205804e8f4f4d816cfbdc5f490e8d563601c0f948abb66456b0c2c91850c5a7480adba8e1d1b63be871694550b33357eff18e5360c142be05389c879')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
