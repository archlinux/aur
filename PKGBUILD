# system requirements: clustalo, gs, perl
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LowMACA
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='LowMACA - Low frequency Mutation Analysis via Consensus Alignment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  clustal-omega
  ghostscript
  perl
  perl-lwp-protocol-https
  perl-xml-simple
  r
  r-biocparallel
  r-biostrings
  r-cbioportaldata
  r-data.table
  r-gridbase
  r-httr
  r-lowmacaannotation
  r-motifstack
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-stringr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1b37fd41e3a41169d52cd5164972d3455c4d914bedfa5ccc54fcebf8fb18a248')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
