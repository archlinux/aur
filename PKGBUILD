# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FELLA
_pkgver=1.21.0
pkgname=r-${_pkgname,,}
pkgver=1.21.0
pkgrel=1
pkgdesc='Interpretation and enrichment for metabolomics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
  r-keggrest
  r-plyr
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-biomart
  r-dt
  r-gosemsim
  r-knitr
  r-magrittr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rmarkdown
  r-shiny
  r-testthat
  r-visnetwork
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ecfc5e14303dd2815f56b0746717c3581a464bb137160b40905a66f8f1ab8a4b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
