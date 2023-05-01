# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pcaExplorer
_pkgver=2.26.1
pkgname=r-${_pkgname,,}
pkgver=2.26.1
pkgrel=1
pkgdesc='Interactive Visualization of RNA-seq Data Using a Principal Components Approach'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-base64enc
  r-biomart
  r-deseq2
  r-dt
  r-genefilter
  r-genomicranges
  r-ggplot2
  r-ggrepel
  r-go.db
  r-gostats
  r-heatmaply
  r-iranges
  r-knitr
  r-limma
  r-nmf
  r-pheatmap
  r-plotly
  r-plyr
  r-rmarkdown
  r-s4vectors
  r-scales
  r-shiny
  r-shinyace
  r-shinybs
  r-shinydashboard
  r-summarizedexperiment
  r-threejs
  r-tidyr
  r-topgo
)
optdepends=(
  r-airway
  r-biocstyle
  r-htmltools
  r-markdown
  r-org.hs.eg.db
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5dfe0e875996532721d2e13ac77be40fce860717bc628ff905cb2dada2c62413')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
