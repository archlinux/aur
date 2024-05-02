# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multtest
_pkgver=2.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Resampling-based multiple hypothesis testing"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-biobase
  r-biocgenerics
)
optdepends=(
  r-snow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c84ca66c69c21ec6449a36205b1af93b')
b2sums=('3ae6e0f1c5cc7dd8935c2a574d2108203c1b8845128ae206e602cdf451881fdda08fd997c5b3e823eac05671017d8995c39df40a67e5de9d3f124ae43c636d1d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
