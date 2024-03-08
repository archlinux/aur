# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bezier
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Toolkit for Bezier Curves and Splines"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ff007027f4c27591f9b47bf43be8aaa1')
b2sums=('73ca6708c6a9132bc70bbb44f121ed461e23811ad8c654fd69f68be9bfdcdaa76aa96d8dde77eae3238cffbf2f0ed75183001cc14b43bd94b17b94b7b6b02d20')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
