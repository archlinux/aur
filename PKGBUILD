# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spdep
_pkgver=1.4-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatial Dependence: Weighting Schemes, Statistics"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-deldir
  r-e1071
  r-s2
  r-sf
  r-sp
  r-spdata
  r-units
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-classint
  r-dbscan
  r-ggplot2
  r-igraph
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-rspectra
  r-spam
  r-spatialreg
  r-tinytest
  r-tmap
  r-xtable
  r-rgeoda
  r-mipfp
  r-guerry
  r-codingmatrices
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cb680130041f8d8f5433a56ea4eab948')
b2sums=('0827d2c90be2c865e10a10e530a55bc49cd0bdeefe8e2d8fe63077fa485a88782fc7b89969a64730da20676c539969ef09316263d3d4d50c32a0dcc1ac592ea4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
