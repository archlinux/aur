# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spdep
_pkgver=1.3-10
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
md5sums=('ac4fed4f241b5f6b44782615120207f3')
b2sums=('0f37b742aa5f62cfc56d50f3943e3b98180fac44c90039c0f055a8fbcdc11b3ddd304d7c1129a190498ad3a213576650c2b97df6f97804a45dcf7ada35d79302')

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
