# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scanMiRApp
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="scanMiR shiny application"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotationdbi
  r-annotationfilter
  r-annotationhub
  r-biocparallel
  r-biostrings
  r-data.table
  r-digest
  r-dt
  r-ensembldb
  r-fst
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-htmlwidgets
  r-iranges
  r-plotly
  r-rintrojs
  r-rtracklayer
  r-s4vectors
  r-scanmir
  r-scanmirdata
  r-shiny
  r-shinycssloaders
  r-shinydashboard
  r-shinyjqui
  r-txdbmaker
  r-waiter
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.mmusculus.ucsc.mm10
  r-bsgenome.mmusculus.ucsc.mm39
  r-bsgenome.rnorvegicus.ucsc.rn6
  r-knitr
  r-rmarkdown
  r-shinytest
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('737b7abc0ac7def7215de0f2b99e7365')
b2sums=('ff0df3fcf0ce90d4adc3104ae48bf563ab65a9e2e8a1690870820ec963991399a3945c5e9cc7ecc4fbc38b8ceb91ba852d0d16fc6a44dd44bdc5e730d3373450')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
