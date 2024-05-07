# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=codingMatrices
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Alternative Factor Coding Matrices for Linear Model Formulae"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-fractional
)
optdepends=(
  r-car
  r-dplyr
  r-ggplot2
  r-knitr
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b7d15a0ce93cab8e8fb032ef8f4bc0e3')
b2sums=('2ef7720cae7b1886c9c7554985b57f39d3c51f995f6f9eb6514ce786e61728bef292699aac2080fa96aa8dcf557de301c3b2fb55a5c8de0d76314832f3cec7a5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
