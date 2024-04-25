# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sampleSelection
_pkgver=1.2-12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Sample Selection Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-formula
  r-maxlik
  r-misctools
  r-mvtnorm
  r-systemfit
  r-vgam
)
optdepends=(
  r-ecdat
  r-lmtest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f64dba3ee084522778f3fe7f33c60ba4')
b2sums=('89f02a465c5409abdd1bce5073dd59a84cbbac1e87f4cee5739e965824cb626d1332bd2b58d388ca3bea3b402dd7dce61879dedce63b6be7af331a1e3791d54a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
