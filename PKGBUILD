# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=limSolve
_pkgver=1.5.7.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Solving Linear Inverse Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  r-lpsolve
  r-quadprog
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6e05187f84421d535439364d4a6715af')
b2sums=('4e2d8b0813296af9a3879a69771475cebe4fd30883fd91be919964ed60dc89c05d1c326d769818d288108b9700735f1c9de13cb4d8336466c3999506895b14ee')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
