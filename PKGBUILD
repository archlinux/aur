# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gee
_pkgver=4.13-26
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Generalized Estimation Equation Solver"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  blas
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0dfe58c9fb7b6f6627d0b501eb3ba15e')
b2sums=('e077fe84c3ca1d32784a893a68e4ed8e301f80b7a6dce3232b64f08cdc230978fb22af216f449b0e7c9002f23eafc7430e07e78eba93e3a6988ddab24cdf040b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
