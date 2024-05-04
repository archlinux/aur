# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BEDASSLE
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quantifies Effects of Geo/Eco Distance on Genetic Differentiation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-emdbook
  r-matrixcalc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('542260c8bb0602de2a5b6bff555da16c')
b2sums=('42824117c0a3a0c6d31c01f53ecd99d77f3936947b1b5d375f4e925a014193b9c7e21fe400b6e8297da63187c6d352b60af8ccc48959ed95d7caefbb49ed987b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
