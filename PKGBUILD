# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MSstatsShiny
_pkgver=1.4.3
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
md5sums=('5ccab67d44c1dbead7fcac50e5c5b907')
b2sums=('744638557671dc074218bfb14366dc487e9e2cd9a9d07a51ee252fbb42e67c12cca2b126f27e165e544c122bc891625e30e1946c00f4fd9b16d9ea421e54903c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
