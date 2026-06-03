# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=limSolve
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Solving Linear Inverse Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  r-lpsolve
  r-quadprog
)
optdepends=(
  r-knitr
  r-rmarkdown
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ab047e452b906091cad9044c8c2626a3')
b2sums=('2ef71f1fbddb9fe36b9ce8b3fbc3aebce4a6179a92e7e6ceff4a45da65f2ff457bbab6bb8cc29c4454ec448b91ae23c7f8584295169b851c31db7d48d41cd678')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
