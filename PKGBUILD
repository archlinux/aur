# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gdistance
_pkgver=1.6.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Distances and Routes on Geographical Grids"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-igraph
  r-raster
  r-sp
  r-terra
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b0ccc424ac22b48c58f665f15c2e83a2')
b2sums=('2969d1c666cabfb45d573c7edac64b2f4cfc4d4183d0c9113eb6cf60309c0add229a524cf3f67eca54e674b06953fb95ceb3602417a356e05e626fb7a924ed7d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
