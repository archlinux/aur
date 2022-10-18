# system requirements: clustalo, gs, perl
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LowMACA
_pkgver=1.26.2
pkgname=r-${_pkgname,,}
pkgver=1.26.2
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
sha256sums=('a19495a3847ca2eb680576a71fd77a039385baab2eb659e241c644ee1f3ddd46')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
