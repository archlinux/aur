# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=widgetTools
_pkgver=1.86.0
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
md5sums=('a507d62aff8f2558258ad4d9e357bd30')
b2sums=('fdb840f1500f4bd7a3fd481130ce7858d9985bc0f028c48bed3830c2d9f6c86b1fac3b1a1bff433de8c799f82934552afe87d774c9c28848dfa6d01c76c5fc5c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
