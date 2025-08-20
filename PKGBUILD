# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ismev
_pkgver=1.43
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An Introduction to Statistical Modeling of Extreme Values"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('78963b1378336d4848a21a214abb58dc')
b2sums=('224e9b921c6fc9e3ddd3b84fab134ac232a1ebaca2ca9baab2a09eb6c3d7d4764996d0feae4662524ca69cb993b952239699ff7ce9c3500964a180330a72dc24')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
