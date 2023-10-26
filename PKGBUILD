# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KnowSeq
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='KnowSeq R/Bioc package: The Smart Transcriptomic Pipeline'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-caret
  r-cqn
  r-e1071
  r-edger
  r-ggplot2
  r-gridextra
  r-hmisc
  r-httr
  r-jsonlite
  r-kernlab
  r-limma
  r-praznik
  r-r.utils
  r-randomforest
  r-reshape2
  r-rlist
  r-rmarkdown
  r-stringr
  r-sva
  r-xml
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eb2f9ca53b3d8f21b11ba786ace6077a8eb67e147d8af7f03e104e8d2ae7c518')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
