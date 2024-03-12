# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=openair
_pkgver=2.18-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for the Analysis of Air Pollution Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-cli
  r-dplyr
  r-hexbin
  r-latticeextra
  r-lubridate
  r-mapproj
  r-purrr
  r-rcpp
  r-readr
  r-rlang
  r-tibble
  r-tidyr
)
optdepends=(
  r-mapdata
  r-maps
  r-quantreg
  r-spelling
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('99eaa25bc99080a9e8dcd0e3bed44221')
b2sums=('d49eade7378983af006cb148e073493149a8a7570a7563e689c6fd415efdcd8132ea6a00acfa86cfe1fd91edf580092d16c5e2b3419fa738f75acb0df2944253')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
