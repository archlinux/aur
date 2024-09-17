# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=simplifyEnrichment
_pkgver=1.14.1
pkgname=r-${_pkgname,,}
pkgver=1.14.1
pkgrel=1
pkgdesc='Simplify Functional Enrichment Results'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-circlize
  r-clue
  r-colorspace
  r-complexheatmap
  r-digest
  r-getoptlong
  r-globaloptions
  r-go.db
  r-gosemsim
  r-org.hs.eg.db
  r-proxyc
  r-slam
  r-tm
)
optdepends=(
  r-apcluster
  r-biocmanager
  r-clusterprofiler
  r-cola
  r-cowplot
  r-dbscan
  r-do.db
  r-dose
  r-dynamictreecut
  r-flexclust
  r-fpc
  r-genefilter
  r-ggplot2
  r-gridextra
  r-gridgraphics
  r-gridtext
  r-hu6800.db
  r-igraph
  r-interactivecomplexheatmap
  r-knitr
  r-mcl
  r-mclust
  r-msigdbr
  r-reactome.db
  r-rmarkdown
  r-shiny
  r-shinydashboard
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8faadd26c01d3596e47d588d97a7b61fa878cb3ee7fae27cbab696f5788f724d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
