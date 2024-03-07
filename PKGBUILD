# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rmutil
_pkgver=1.1.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Utilities for Nonlinear Regression and Repeated Measurements Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b7b0dfa56534cab7cc4a8b57bac51317')
b2sums=('04f850b4698cd3cbb14254b2ae4f376088fe6b7e423320c30a9f8d346c04cdaae9735f0439c3f3344c1d3ab833835a5112668fc7d979484e200e6aea130fecc5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
