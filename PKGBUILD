# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MetaboSignal
_pkgver=1.30.1
pkgname=r-${_pkgname,,}
pkgver=1.30.1
pkgrel=1
pkgdesc='MetaboSignal: a network-based approach to overlay and explore metabolic and signaling KEGG pathways'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biomart
  r-ensdb.hsapiens.v75
  r-hpar
  r-igraph
  r-kegggraph
  r-keggrest
  r-mwastools
  r-mygene
  r-org.hs.eg.db
  r-rcurl
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('237ec33c5c570348479618e7d976778f09ad1f918d459217965c6eacff53224f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
