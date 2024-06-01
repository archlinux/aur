# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MSstatsShiny
_pkgver=1.6.1
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
md5sums=('297a9632dcea998bf47427066885682f')
b2sums=('88d472682f289b56ee8b20f6b5fdf5c73659951f08e89f84cd851aa442f8a25d0e3c49ad1be98c7d18937373d65a6809ab37ff64aaaaad27e1c2b35eb7612503')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
