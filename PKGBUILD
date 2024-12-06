# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GoFKernel
_pkgver=2.1-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Testing Goodness-of-Fit with the Kernel Density Estimator"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('534187e40860b1f0ef40298fa58d932d')
b2sums=('4c674805ab0c5646b3ad8a94420c61187f583893ff9335185d89e91481b2fa3ffefdc20584890f22b42d39975851853bb8334aec093d18a8754738dc9edbd690')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
