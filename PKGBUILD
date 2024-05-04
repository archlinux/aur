# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=kit
_pkgver=0.0.17
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data Manipulation Functions Implemented in C"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3fee35f77dd5f375fcce1adeac5c7265')
b2sums=('b2d2407d4c03155e7f1fe5cfe91df4a67c76d883dbaee504082955c5898881f87a7ef38f314f9c0f11e17f3c27fe64f919d4906722ee86968567837de5d759e0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
