# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=praznik
_pkgver=13.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Information-Based Feature Selection and Scoring"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('689d7fcc651a77c18e0e4c8d3fac5d23')
b2sums=('b6eebcf79e08e9bd3e1ab3c3233cb5cd50790343020e05411d712afb720e95aa6772c36132edee74c889d80683a48304196c0683c128c1f3df4439575ef0ea11')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
