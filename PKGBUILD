# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BgeeDB
_pkgver=2.28.0
pkgname=r-${_pkgname,,}
pkgver=2.28.0
pkgrel=1
pkgdesc='Annotation and gene expression data retrieval from Bgee database. TopAnat, an anatomical entities Enrichment Analysis tool for UBERON ontology'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-curl
  r-data.table
  r-digest
  r-dplyr
  r-graph
  r-r.utils
  r-rcurl
  r-rsqlite
  r-tidyr
  r-topgo
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d6e62249a3d00f6f288ea6ddf4e1100433d1be67417980a14f8fc3c883b811aa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
