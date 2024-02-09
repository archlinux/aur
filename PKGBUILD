# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=minpack.lm
_pkgver=1.2-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="R Interface to the Levenberg-Marquardt Nonlinear Least-Squares Algorithm Found in MINPACK, Plus Support for Bounds"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f1cda9e2b12e4a6e3ea63c165642797e')
b2sums=('ebd1e712723e2e32f41576ff676326cfa8f4cb67b85717791217f0d229f5fd76719be581657ca336cc894899bbaadb4046a2196711060ea1f337b047a7a544e3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
