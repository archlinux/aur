# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TreeDist
_pkgver=2.9.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Calculate and Map Distances Between Phylogenetic Trees"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-ape
  r-cli
  r-colorspace
  r-memoise
  r-rdpack
  r-shiny
  r-shinyjs
  r-treetools
)
makedepends=(
  r-rcpp
)
optdepends=(
  r-bookdown
  r-ggplot2
  r-hypervolume
  r-kdensity
  r-knitr
  r-phangorn
  r-plotly
  r-plottools
  r-protoclust
  r-quartet
  r-rcpp
  r-readxl
  r-rgl
  r-rmarkdown
  r-rogue
  r-spelling
  r-ternary
  r-testthat
  r-treedistdata
  r-treesearch
  r-umatrix
  r-uwot
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('09ee963410054af358bcba69aa9c9a39')
b2sums=('865ef0a635cc29052a494e407898e7c39d4cb7fab73ad75df0da2bcde542711f97a9fe5dc041e090ef1a87d8e1d289a9302dfbf617b204730fa3f44553528508')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
