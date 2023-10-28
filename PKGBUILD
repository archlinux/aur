# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FELLA
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
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
sha256sums=('e224c04e3702d64e67f0b3ab5ee98190263827c1d5dda6b51fb0bbb3fdd9b236')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
