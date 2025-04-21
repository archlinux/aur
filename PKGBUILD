# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=simplifyEnrichment
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=2.2.0
pkgrel=1
pkgdesc='Simplify Functional Enrichment Results'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
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
  r-simona
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
sha256sums=('910b3bb62381791b6651ee5926b5ecc196205f8de7846623049d94370887a385')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
