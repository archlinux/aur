# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gee
_pkgver=4.13-25
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalized Estimation Equation Solver"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  blas
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5893e45bd896a40a3aaf1ca848a2f5b5')
sha256sums=('e140881e2febe793a24086a2d179062b9995db901257d678f85d220441400e89')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
