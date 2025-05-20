# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.geom
_pkgver=3.4-1
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
md5sums=('d14f6f8794cfbae12e43c4726abf4623')
b2sums=('9d80a07bcfc0d7517569848b6a197b5995b0255b55635a8bfd1a281f6c14aa499879737c47b31367a92b76af8f6273d831c7d0fc99d152e4feedecedc651d9a9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
