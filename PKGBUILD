# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TreeDist
_pkgver=2.8.0
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
md5sums=('b89200bb9162762d9019a24d2c731d4e')
b2sums=('dbd0a6c94e71f49d74f4c3583dc30cc7af14941b9f6488a78ad65e4fe390557659cc397db4863b2bc64ea5c7c34976aab75f0afb3e74d7d7adef89673791e4c3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
