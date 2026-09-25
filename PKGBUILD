# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=directlabels
_pkgver=2026.8.27
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Direct Labels for Multicolor Plots"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-data.table
  r-rcpp
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
md5sums=('ccbb5731295206e6b2bdb5a6a50e2f87')
b2sums=('f20ae00eed80640ebbf7c367d4c8087460cc06801645da564702cc46864e458de4fc4cfc71bd10ed6be0ca486496cb271fe34d877a6d76ed9b7c90c02faf2119')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
