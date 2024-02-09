# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=startupmsg
_pkgver=0.9.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Utilities for Start-Up Messages"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d9bb261e2964199f537f447af8672c91')
b2sums=('8edb58bba8ebeefbc35f7e3793bfda0a01b091d192a3373e0e888fb6dceb173dc87729add7199d77ab5ab7bb5a1c9bd0d4a448c807ff983886b085f5afec2b2e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
