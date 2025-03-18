# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.geom
_pkgver=3.3-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Geometrical Functionality of the 'spatstat' Family"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-deldir
  r-polyclip
  r-spatstat.data
  r-spatstat.univar
  r-spatstat.utils
)
optdepends=(
  r-fftwtools
  r-spatstat
  r-spatstat.explore
  r-spatstat.linnet
  r-spatstat.model
  r-spatstat.random
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('16e849dc815b6187722bb9eed3648100')
b2sums=('f2f785d8d3f83be2dc7f4aa8e23bd763c3c2e83dddfc6b3ce087f117b6fb72ae28fccec02c78a5d6613a3128d02d179daea5b0e88c40fe89c8e088471ccd111d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
