# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.geom
_pkgver=3.6-1
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
md5sums=('a8d62658c894b764338d6157c7284553')
b2sums=('d9dfb65c8f129d9d795553a5722893728cebcac33194d68a8b7e537cc78987d1eca371b513dcf87125948b2b72ac50ee2db594dfd2c0e0d5c92e87db1010eb3f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
