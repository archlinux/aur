# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=amap
_pkgver=0.8-20
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Another Multidimensional Analysis Package"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-biobase
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ad7d821e24f7814d3895f7ccb88e3892')
b2sums=('fac82a09d88b5839a0311d55086769295bd3e988a85df8d1e678dda7f1617892a58218153fb7ea49abee9bdc15aaef4d9f32a6f8c9d898b86ddaee6c11829cc9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
