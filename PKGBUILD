# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fishMod
_pkgver=0.29
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Fits Poisson-Sum-of-Gammas GLMs, Tweedie GLMs, and Delta Log-Normal Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ac6dc16674f459850e7e19760e8beeee')
b2sums=('a5c794fcea1b85131d526cddf9b9f58dbaed934b493734ae6d3353c3da2a3b4068ad42d65e9fcb5caee3aa44c930187c0d2a365785cce5c00f01069f6ccb0c2c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
