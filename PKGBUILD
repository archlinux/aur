# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RiboCrypt
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Interactive visualization in genomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bslib
  r-data.table
  r-dplyr
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-htmlwidgets
  r-httr
  r-iranges
  r-jsonlite
  r-knitr
  r-markdown
  r-nglviewer
  r-orfik
  r-plotly
  r-rcurl
  r-rlang
  r-shiny
  r-shinycssloaders
  r-shinyhelper
  r-shinyjqui
  r-stringr
)
optdepends=(
  r-biocstyle
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('040c60421c2d11342ee1879e42723bece268b2f41b2ba26cfc3112e602f5c82b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
