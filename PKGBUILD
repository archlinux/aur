# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=relations
_pkgver=0.6-14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data Structures and Algorithms for Relations"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-sets
  r-slam
)
optdepends=(
  r-clue
  r-lpsolve
  r-rglpk
  r-rgraphviz
  r-rsymphony
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('638238c1d7ff1a1d4abfdfe48cffbdb9')
b2sums=('8266547698ce106aa5148ed40e389050a6148afdf8acadda3d8fe77ed7db368a4fddbc4c4edbd9067f239327817d335e43b1cec07f8a3913d0a2d8a75a6045a3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
