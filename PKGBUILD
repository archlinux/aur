# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=psygenet2r
_pkgver=1.34.1
pkgname=r-${_pkgname,,}
pkgver=1.34.1
pkgrel=1
pkgdesc='psygenet2r - An R package for querying PsyGeNET and to perform comorbidity studies in psychiatric disorders'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-bgeedb
  r-biobase
  r-biomart
  r-ggplot2
  r-go.db
  r-igraph
  r-labeling
  r-rcurl
  r-reshape2
  r-stringr
  r-topgo
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('85aed0f1e77da2fc7ba3ef62a07e22605dbc7dce90398a36a009b96d8efc1223')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
