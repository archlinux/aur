# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dfidx
_pkgver=0.0-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Indexed Data Frames"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-dplyr
  r-formula
)
optdepends=(
  r-aer
  r-knitr
  r-mlogit
  r-plm
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('26d1468f30c4c3d98a1251f427937c63')
b2sums=('487ebffcdc74f6eba40d3101abdc36dc0a9c9593a0ab409a6503eebfbda55e11a052d2566ccc77f75f0a37683da1d62b4b0d266ce7c71b95e840389bc26a47d7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
