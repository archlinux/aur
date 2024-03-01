# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=htm2txt
_pkgver=2.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Convert Html into Text"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f24053cecfeaa1a1b32519c08f42888b')
b2sums=('b120540c2877c85e761c7b34f57467c3535915e330a0150caf6f15bb04b66c9b69d9e68b92f217de18f9a397abe7d83d0e0b62eef41e7eaeb3be108f85370d1d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
