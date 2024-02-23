# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shape
_pkgver=1.4.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions for Plotting Graphical Shapes, Colors"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('42b7951c69b6c93178c07f2d189d0c89')
b2sums=('a4173945d33c6962d0b12f904f3b637e77bc5fcd2f85727e56d9fdabaaf28b519125998ba61323a9b2496d0677cfb8fc669d40cf993850574cb0425f6b416733')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
