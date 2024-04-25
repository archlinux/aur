# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=truncreg
_pkgver=0.2-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Truncated Gaussian Regression Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-maxlik
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6ddc73494a349da69b23f859ffe89a54')
b2sums=('b9b229a93b11c1030f8d3ecf2a3d94cbccda8cddbdf19ee0f8a13469d47ac620312e30a910ad3e8b5fd3b935722ad9b00c52c6e135c7be5f5d4bd6fbc3670030')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
