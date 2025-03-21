# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOexplorer
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="a webserver for gene expression analysis and visualisation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-car
  r-dt
  r-edger
  r-enrichr
  r-factoextra
  r-geoquery
  r-ggplot2
  r-heatmaply
  r-htmltools
  r-httr
  r-impute
  r-knitr
  r-limma
  r-markdown
  r-pheatmap
  r-plotly
  r-r.utils
  r-readxl
  r-scales
  r-shiny
  r-shinybusy
  r-shinycssloaders
  r-shinyheatmaply
  r-stringr
  r-sva
  r-umap
  r-xfun
  r-xml
  r-xml2
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-rmarkdown
  r-testthat
  r-usethis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4c551b3a32be33591646d06feae085b9')
b2sums=('b6f8b5eac8faeccacf67080d4956f09e72fe4b0c7c6ecf928aabd4047b3da9b3542b321aa42f54bfb73654f35f676c7914fb240353f7e17f71e38f59814f0f5b')

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
