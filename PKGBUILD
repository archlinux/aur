# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geigen
_pkgver=2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Calculate Generalized Eigenvalues, the Generalized Schur Decomposition and the Generalized Singular Value Decomposition of a Matrix Pair with Lapack"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('70741830d96bb70df1748d341c52295e')
b2sums=('ee994b90628b7d5c7febdf5f6ede6113679259ad07bfa2b4d11ef5fa11c03ad3e755988c7c590265b49b1b8141c390d2aa88d2f96ea3db15e46882407296b161')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
