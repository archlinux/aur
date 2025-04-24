# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spdep
_pkgver=1.3-11
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
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1b66718a71e81fd54260cbad899378ee')
b2sums=('334b2fe9411575f434ad6a06a39f06b74eeb34e51a67a04ebef6e773bbebd9f332b0d973ffaf5b33054a6dbfbd84a19a4678ce58a1238907b065d5d6c241b0a5')

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
