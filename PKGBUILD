# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scanMiRApp
_pkgver=1.14.0
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
md5sums=('5efea426eb3f818b5b761c9348b560bb')
b2sums=('e792c3a3e4918067f83118015a729bb923943d070bfe06e4253f5638fc082849e889150505da69a1b3d18579bc1af27bc993c70f0488c44cad5380524d6b0a14')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
