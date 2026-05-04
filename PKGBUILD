# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=directlabels
_pkgver=2026.4.23
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Direct Labels for Multicolor Plots"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-quadprog
)
optdepends=(
  r-alphahull
  r-broom
  r-dplyr
  r-ggplot2
  r-ggthemes
  r-inlinedocs
  r-knitr
  r-lars
  r-latticeextra
  r-magick
  r-markdown
  r-mlmrev
  r-rcolorbrewer
  r-reshape2
  r-rlang
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7956bf4f1927f5865cbbb22f0ba490b2')
b2sums=('ec16b37a785e8f0bace4c886c7e80cb84e96962655b0eaa30b5a1432c15b845526743736b4aef37f52e8bf0169d6728d099258d03e28be25b77552505ffbaa58')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
