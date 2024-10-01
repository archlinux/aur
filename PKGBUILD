# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fishMod
_pkgver=0.29.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fits Poisson-Sum-of-Gammas GLMs, Tweedie GLMs, and Delta Log-Normal Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c68df257c177e2d586392594378560b8')
b2sums=('b0d797cf13e2e1eab54f0fb60766e222a6c1e023009d7a38ce8c10c8ee4946bd9e12ea2b7b5314e4380879bea07c56a8fed0730911709756ad945b3046182f9e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
