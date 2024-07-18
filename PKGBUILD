# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.geom
_pkgver=3.3-2
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
md5sums=('2ce8ce9792ef41d0f33e57084f4ada03')
b2sums=('693ba324b3cdc9b66eb5004fb6d2d25e89a61771b23a80500e3e8ce160bbcaf4b7253122f53e7f3c7d3d0e0637bfd749ad21cc5ab2e938528a40157c3afe681f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
