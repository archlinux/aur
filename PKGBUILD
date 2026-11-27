# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ViSEAGO
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='ViSEAGO: a Bioconductor package for clustering biological functions using Gene Ontology and semantic similarity'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-annotationforge
  r-biomart
  r-circlize
  r-complexheatmap
  r-data.table
  r-dendextend
  r-diagrammer
  r-dt
  r-dynamictreecut
  r-fgsea
  r-ggplot2
  r-go.db
  r-gosemsim
  r-heatmaply
  r-htmlwidgets
  r-igraph
  r-plotly
  r-r.utils
  r-rcolorbrewer
  r-scales
  r-topgo
  r-upsetr
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-corrplot
  r-htmltools
  r-knitr
  r-limma
  r-org.mm.eg.db
  r-processx
  r-remotes
  r-rgraphviz
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7a74292d70b2c74e069b5ae0acd66626b50aa162f8feb8c1501f00dd0eccf624')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
