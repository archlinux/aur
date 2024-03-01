# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=kit
_pkgver=0.0.16
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
md5sums=('af551d3c95b2d509d6ee4bbc2545b199')
b2sums=('e1180750b51eaa8a2b5377b70013de32d2aa72d15f448034217b1c97d225af1645d230002f43a21c97bd7e7f70c03902dfe90f01beb7e6b8c698ece508ef3756')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
