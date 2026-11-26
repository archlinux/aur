# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=widgetTools
_pkgver=1.92.0
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
md5sums=('a370a86c8c714c029f91160975c889c6')
b2sums=('25979000304ecf946db89be35a2cec485aed1722728541a5d45790bcb9c466710f469161bcdb2d8ea1fd48cdc5e0c4a631066baa029bc80eaf6a6d9f51f61d9a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
