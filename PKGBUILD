# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multiSight
_pkgver=1.7.0
pkgname=r-${_pkgname,,}
pkgver=1.7.0
pkgrel=1
pkgdesc='Multi-omics Classification, Functional Enrichment and Network Inference analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CeCILL')
depends=(
  r
  r-anylib
  r-biosigner
  r-caret
  r-clusterprofiler
  r-config
  r-deseq2
  r-dplyr
  r-dt
  r-easypubmed
  r-enrichplot
  r-golem
  r-htmltools
  r-igraph
  r-infotheo
  r-metap
  r-mixomics
  r-networkd3
  r-ppcor
  r-r6
  r-reactomepa
  r-rmarkdown
  r-rwikipathways
  r-shiny
  r-shinydashboard
  r-stringr
  r-ggnewscale
)
optdepends=(
  r-attempt
  r-biocstyle
  r-knitr
  r-markdown
  r-org.mm.eg.db
  r-processx
  r-rlang
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2cad84a8893d54a48bc5039c6b9056a2f5d5c722bc03556a8b14140171a055ec')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
