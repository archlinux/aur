# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=openair
_pkgver=2.18-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for the Analysis of Air Pollution Data"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
md5sums=('301c3df8314138c6193499cff523c396')
sha256sums=('e06febbe421a6493dff0a3c05b894bb1fffdfb1c4fed576288974f5dae597cc3')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
