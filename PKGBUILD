# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gee
_pkgver=4.13-27
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('c8c12b0d5dcbd8480ad4def6f1523991')
b2sums=('ad94f8bc35863b72c9a5c2cb540a80470f79d584b4cb53b7eb301cea14f1cd360f19cf91e25f32ae7dd274b1cf81b1235cb8e8b0ac4825a57fd5d2112cf25b04')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
