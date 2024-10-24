# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=memisc
_pkgver=0.99.31.8.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Management of Survey Data and Presentation of Analysis Results"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-data.table
  r-jsonlite
  r-yaml
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-sandwich
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c2ca580fc2d0372d13dab6a90c2ca749')
b2sums=('2fdd4a583bd905790ab474f4e0fd301255c1b83c1c4bc43d9aa8d55540dcf66bb4991329e9567acd54802cfd54633801e63d41876b5630af6cd774c0b2dfef3f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
