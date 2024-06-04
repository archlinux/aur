# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MSstatsShiny
_pkgver=1.6.2
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
md5sums=('5846d8ee47fce582697a5e42d196c723')
b2sums=('12094d334be39e44f02d46dffbddaaf219b6470d1701c309a9ee9d0d373c6b5a3baca83cfb8b96fac4cb0cb9f72317b73edc63bbd4c067566f15fc7025037388')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
