# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=agricolae
_pkgver=1.3-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Statistical Procedures for Agricultural Research"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-algdesign
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('27cdffab9bd7cf428cb005d41db13c00')
b2sums=('b76606cf9107d06273d92d7f7eeb0de27f1013431c0ff2077906843c68f87d8295211f5889718a7fd15f3a9498c21e01d4a27af94c11b61cc7f21ab2fe844a8a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
