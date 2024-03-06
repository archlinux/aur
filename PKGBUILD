# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FD
_pkgver=1.0-12.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('8f1ed234859f08334e3cd5dab8ce58f1')
b2sums=('1a9f239518d998b895018c6ae0b4a96cb24abbad5003082bfeee7df3262a98193a205503bc040c0cfabc188d261fe8ce9279b307eddd47709335a0458dfd4844')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
