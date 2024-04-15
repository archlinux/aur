# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.numbers
_pkgver=0.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Assertions to Check Properties of Numbers"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-assertive.base
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/$_pkgname/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('94eead383227d15353b9629305c7269a')
b2sums=('a02c6c3b03bb7016fda7ede441c9e4149ccb661d9a0b163511aa1f86b33257273a07a10acadbb3f99225e8ae40cf1fbdee084d4d30f775b2b85dbb184a42ce75')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
