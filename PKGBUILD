# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=longitudinal
_pkgver=1.1.13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Analysis of Multiple Time Course Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-corpcor
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ac7842e3fa9e4f5a5a1ce49c66a20317')
b2sums=('167bbfce334bdb1dab22faa15ae20ff178e7ceaf955e0455cfe7dc39d64801baebe407a10b718590778334f9c8f7a15fb0d2233a1c52a65a0a396082420419af')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
