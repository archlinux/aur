# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ada
_pkgver=2.0-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="The R Package Ada for Stochastic Boosting"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('25ac0dc2650fba9e19f3d15c7c6721c1')
b2sums=('4e92714b8467b2d1ac9599a337c861e12ce3aad051e438310ff17fc2f3e1d3f44eb05d43d146ae27e9806bd4cdcc1545b3e8d94e6c860f9b30b2a2fd27d26ee7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
