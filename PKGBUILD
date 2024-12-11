# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gee
_pkgver=4.13-29
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
md5sums=('e1a257a32d40956e61039b59318b944b')
b2sums=('1d26492127980972db87f9a082d6222f25eb425b56536c4f48ed75eca816726f4c7afb19519097e992eae5d5d558dd99b0be0ada0c05ec61ab9369ff88e25eb9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
