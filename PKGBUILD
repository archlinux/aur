# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spdep
_pkgver=1.4-1
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
md5sums=('55fb98138eef16224339fd319ba8a4f2')
b2sums=('bc76621c0bcb2cae23bd7dc513edd052da0ea6a634fa482dd69b9d051caa754b72d7927d3333cff7a649d36ea4eebc4deb18e507a3d1ca6f69e42a56a43c5d5d')

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
