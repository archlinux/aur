# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scanMiRApp
_pkgver=1.18.0
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
md5sums=('05b89007ec150a9b37043f8ccf045408')
b2sums=('178fe8970df8cb995377cde22e5c90c0cf59b8e4bddcc4066022771b144414192e74d1c29b8b17dd3fc28d08b5b3fc411b22d5451c1744ec6a27acd8a0816dc3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
