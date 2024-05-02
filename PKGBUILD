# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=InteractiveComplexHeatmap
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Make Interactive Complex Heatmaps'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-clisymbols
  r-complexheatmap
  r-digest
  r-fontawesome
  r-getoptlong
  r-htmltools
  r-iranges
  r-jsonlite
  r-kableextra
  r-rcolorbrewer
  r-s4vectors
  r-shiny
  r-svglite
)
optdepends=(
  r-airway
  r-biocmanager
  r-circlize
  r-cluster
  r-cola
  r-data.table
  r-deseq2
  r-dt
  r-enrichedheatmap
  r-genomicfeatures
  r-genomicranges
  r-go.db
  r-goexpress
  r-gplots
  r-gridtext
  r-hilbertcurve
  r-knitr
  r-ks
  r-org.hs.eg.db
  r-pheatmap
  r-pkgndep
  r-rmarkdown
  r-sc3
  r-scater
  r-shinydashboard
  r-simplifyenrichment
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
  r-tidyheatmap
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2bf0cdaa50779ddd9204aa231fc71c1656fec384ed582ef8fb893777dcc8d069')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
