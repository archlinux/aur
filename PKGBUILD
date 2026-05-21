# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TreeDist
_pkgver=2.14.0
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
  r-tbrdist
  r-ternary
  r-testthat
  r-treedistdata
  r-treesearch
  r-umatrix
  r-vdiffr
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8a26cdb842eea25c1fe96e52e9d860ef')
b2sums=('9a327b62f2fd45cc237940026f58e802368d5560e0c706d9886b640607c92c1350527f2e69608210806b543e458d009fbeb4e0807d74cbdef5320e0a5b47db60')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
