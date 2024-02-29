# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distillery
_pkgver=1.2-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Method Functions for Confidence Intervals and to Distill Information from an Object"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('239696bd8b41ce225a7b0a80656d5e21')
b2sums=('ef6208855b76735404ca0592b1456ca0b9c128954b518dd5890e6bb946408856526458cfdd85fd8ab0fe0c4acf0e19dd0f62d3b1e416144a3230184a5caf9059')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
