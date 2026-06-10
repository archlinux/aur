# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TreeDist
_pkgver=2.14.1
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
md5sums=('08d01211dfa0f2118c777600961d43f2')
b2sums=('0f137e666813c38b2ad5514b3fef3725ed3e08505ba01d54b5b4b878653e98c85cdfbbb10356083c8c5e7fc4a8a1cdaed761394b61effb7003d9286ce8a4346b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
