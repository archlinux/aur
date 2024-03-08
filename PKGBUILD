# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LogicReg
_pkgver=1.6.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Logic Regression"
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
md5sums=('5719c33574524baed775d92c4588ddad')
b2sums=('f227cc90c8f299050c9b2d427c7621fba20bd0ff9b2dcc4f2335cdd89003bbef2bf6a16a7eaa82466ad9abf159e0702b4839956e6d68468f9577d6b8f87501b0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
