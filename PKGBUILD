# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=objectSignals
_pkgver=0.10.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Observer Pattern for S4"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6b76acd9915ae4bd1e9b84d972810360')
b2sums=('3f5aaac52de66b72a10eea4da9d40a262f5fb06846e793d010a782e473fd5ebbf9e2e8a9e629126f23d0c275b686b83c5465d3a97136790e4ac661bb875ed9cb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
