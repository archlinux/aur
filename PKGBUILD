# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ggVennDiagram
_pkgver=1.5.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A 'ggplot2' Implement of Venn Diagram"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-aplot
  r-dplyr
  r-forcats
  r-ggplot2
  r-tibble
  r-venn
  r-yulab.utils
)
optdepends=(
  r-knitr
  r-plotly
  r-rcolorbrewer
  r-rmarkdown
  r-shiny
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1f26918b54bd12612f5786f11b46832f')
b2sums=('ab3b5fe65dc69ac1d204a2e1883a922b3e36a50217e08c0c4c4efb283f31e39d95e1a93bb351ff1226b6969c76e3c17d2c2eafc25c824f738b38b6185ab3386c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
