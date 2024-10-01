# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=bulkAnalyseR
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive Shiny App for Bulk Sequencing Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-circlize
  r-complexheatmap
  r-deseq2
  r-dplyr
  r-dt
  r-edger
  r-genie3
  r-ggforce
  r-ggnewscale
  r-ggplot2
  r-ggrastr
  r-ggrepel
  r-ggvenndiagram
  r-glue
  r-gprofiler2
  r-magrittr
  r-matrixstats
  r-noisyr
  r-preprocesscore
  r-rcolorbrewer
  r-rlang
  r-scales
  r-shiny
  r-shinyjqui
  r-shinyjs
  r-shinylp
  r-shinywidgets
  r-stringr
  r-tibble
  r-tidyr
  r-upsetr
  r-visnetwork
)
optdepends=(
  r-annotationdbi
  r-biocmanager
  r-knitr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-readxl
  r-rmarkdown
  r-shinythemes
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4237529b6f084018e02b8bdf247d92cb')
b2sums=('b5f52965ca42b0a5763e897253503f8a8b495d1072169d4ea48dab89ed72032b1f58e6be375ab3d731a7eb2a68dc5e8bc740acefbffeb66800d0460316a1d355')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
