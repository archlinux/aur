# system requirements: clustalo, gs, perl
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LowMACA
_pkgver=1.26.1
pkgname=r-${_pkgname,,}
pkgver=1.26.1
pkgrel=1
pkgdesc='LowMACA - Low frequency Mutation Analysis via Consensus Alignment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-biostrings
  r-cbioportaldata
  r-cgdsr
  r-data.table
  r-gridbase
  r-httr
  r-lowmacaannotation
  r-motifstack
  r-rcolorbrewer
  r-reshape2
  r-stringr
  ghostscript
  perl
  perl-lwp-protocol-https
  perl-xml-simple
  clustal-omega
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eebc77f0151ceb9dcb07f9918e0e73da824f807876f925ac3f0c850bf1bf17c2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
