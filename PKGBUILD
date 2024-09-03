# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TreeDist
_pkgver=2.9.0
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
md5sums=('954461486f4296e6d70e639fb2127dc9')
b2sums=('868343c77b12e024818b2e7e8164cd11561a780b1ad8f4175a2ce4dee5b170c33829888aa5e88e5d527bbfa5b71dd1f05143d9d4b49520d4809458667b51ecdc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
