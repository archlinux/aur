# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=widgetTools
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Creates an interactive tcltk widget"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('83e16ec98e823d13ae3f359047fda205')
b2sums=('db37f3b20c2ba4135d7aa5e6e3ce4087f35fc20bd2f9776f97fdad2166bbf92b365320ac101f39aea1c606852043d04a2740e337574a37a3dddd715167ee2809')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
