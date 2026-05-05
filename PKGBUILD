# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FD
_pkgver=1.0-12.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Measuring Functional Diversity (FD) from Multiple Traits, and Other Tools for Functional Ecology"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-ade4
  r-ape
  r-geometry
  r-vegan
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8d5319fb0ec766992376375cd1bd5a8a')
b2sums=('f24242f6bd13cdb671e671fc322548d8a4d8205c356e921604202f4e316f871f405b15ad684a3d0e8ced61357ecaf7b548e110b5123e026c1baff98c8ab2cd30')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
