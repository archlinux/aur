# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scanMiRApp
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='scanMiR shiny application'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
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
  r-waiter
  r-shinyjqui
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.mmusculus.ucsc.mm10
  r-bsgenome.rnorvegicus.ucsc.rn6
  r-knitr
  r-rmarkdown
  r-shinytest
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b123c11b63ce570b30afe2834ccdc08f872f5726112046125cc71f2d54689b9a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
