# system requirements: Cytoscape (>= 3.6.1) (if used for visualization ofresults, heavily suggested)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=categoryCompare
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc='Meta-analysis of high-throughput experiments using feature annotations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-category
  r-colorspace
  r-gostats
  r-graph
  r-gseabase
  r-hwriter
  r-rcy3
)
optdepends=(
  r-affy
  r-estrogen
  r-genefilter
  r-go.db
  r-hgu95av2.db
  r-keggrest
  r-knitr
  r-limma
  r-org.hs.eg.db
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9464e75ea5d71698a543e7c797250d830257a208c6377eb5b58682d3130a158f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
