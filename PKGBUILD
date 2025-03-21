# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=netZooR
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Unified methods for the inference and analysis of gene regulatory networks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotationdbi
  r-assertthat
  r-biobase
  r-data.table
  r-doparallel
  r-dplyr
  r-foreach
  r-ggdendro
  r-ggplot2
  r-go.db
  r-gostats
  r-gplots
  r-igraph
  r-matrixcalc
  r-matrixstats
  r-org.hs.eg.db
  r-pandar
  r-penalized
  r-rcy3
  r-reshape
  r-reshape2
  r-reticulate
  r-stringdb
  r-tidyr
  r-vegan
  r-viridislite
  r-yarn
)
checkdepends=(
  python-pandas
  python-scipy
  r-testthat
)
optdepends=(
  "python-pandas: pandaPy and lionessPy"
  "python-scipy: pandaPy and lionessPy"
  r-knitr
  r-pkgdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dcb15929eca8b8b2db4a935e9c204f77')
b2sums=('54e85e12375c8d13bcd38b18b3309a52d4d6b944ef6558fc15483e600ca0d3900b335735209080167a3d8bceda78a5aa9e9038d85e27ac2362dc2ac4d5f65a15')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
