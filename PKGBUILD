# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mcr
_pkgver=1.3.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Method Comparison Regression"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-robslopes
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0eaaffb18e6062d58a470b823d7ff1f3')
b2sums=('5d9c985268b568cab0649cc388913316b7903e25913c26bc4a3e3724dd12a8fadf2ce4d5646d851f81ee2032041ebb53d8889e63efb16b1767045b1647a6c63f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
