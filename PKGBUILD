# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MSstatsShiny
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MSstats GUI for Statistical Anaylsis of Proteomics Experiments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=(Artistic2.0)
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
  r-msstats
  r-msstatsconvert
  r-msstatsptm
  r-msstatstmt
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
  r-mockery
  r-rmarkdown
  r-sessioninfo
  r-shinytest2
  r-testthat
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2a58cf6ab9674a13b96e66974d6b15a0')
b2sums=('9edbfb5a0a49d437b7aa4bdce41e54f1881f8e2f9a0bf23106fff13c769c58fc69ce4c280cbe0387cb0f6f5400a347284bbcc454bdb743adf1deda4fdd7ac525')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
