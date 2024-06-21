# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.sparse
_pkgver=3.1-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sparse Three-Dimensional Arrays and Linear Algebra Utilities"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-abind
  r-spatstat.utils
  r-tensor
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('71232a1e22adaed3cdc53ed73903eeaf')
b2sums=('ead7a137c127f9160fc767e80239ada7ccb242cb2312128ac4b5210b8f0b5646525f4e6b602e15ceca1b6b73f14620c748fb866be3426e44fc766674f4af20fa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
