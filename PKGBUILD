# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epivizrChart
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='R interface to epiviz web components'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-epivizrdata
  r-epivizrserver
  r-htmltools
  r-rjson
)
optdepends=(
  r-annotationhub
  r-antiprofilesdata
  r-biobase
  r-biocstyle
  r-genomicranges
  r-hgu133plus2.db
  r-homo.sapiens
  r-iranges
  r-knitr
  r-magrittr
  r-minfi
  r-mus.musculus
  r-rcolorbrewer
  r-roxygen2
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-shiny
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('28b19cf151330fb01ba5113209654cdb0054023933c780deed87b7c89a62f1c4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
