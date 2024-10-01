# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dartR.data
_pkgver=1.0.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Auxiliary Data Package for Our Main Package 'dartR'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-adegenet
  r-crayon
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b2a1a22a89f932b0541da23a3069740e')
b2sums=('09073a6e053167d157ca8d408010d40d783cb85ec21578d67b3e7c66b1a784ec14b6df9e4dce5379d2993e6a0bf695802ad25758cfbd9b28b7f8a35f142612af')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
