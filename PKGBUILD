# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MSstatsShiny
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MSstats GUI for Statistical Anaylsis of Proteomics Experiments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-data.table
  r-dplyr
  r-dt
  r-ggplot2
  r-ggrepel
  r-gplots
  r-hmisc
  r-htmltools
  r-marray
  r-mockery
  r-msstats
  r-msstatsconvert
  r-msstatsptm
  r-msstatstmt
  r-plotly
  r-readxl
  r-shiny
  r-shinybs
  r-shinybusy
  r-shinyjs
  r-tidyr
  r-uuid
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-sessioninfo
  r-shinytest2
  r-testthat
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ecff39e9fbed9dbfd3080c62d023d498')
b2sums=('65eaa5d660f5e042b6d790fc736019de0f841045380b4d87e65546c7985daab11e906fe207a808ed7dc03849f7aa3d86279d7cfe39bf6de05e3dfbaf76bd206c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
