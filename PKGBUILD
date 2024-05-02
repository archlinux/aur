# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=widgetTools
_pkgver=1.82.0
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
md5sums=('e6312f4d4c8129711d5cc252f27451d4')
b2sums=('2f4b6225fa9af4648f0be8aaf317ceef6d66e107dfb142f0e08f936db04ce6c0632f8cf6d2c6b17096212c31da10e1cc62b6524aa873f3ed5ff0cdf46137ccd4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
