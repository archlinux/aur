# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PWMEnrich
_pkgver=4.34.0
pkgname=r-${_pkgname,,}
pkgver=4.34.0
pkgrel=1
pkgdesc='PWM enrichment analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-evd
  r-gdata
  r-s4vectors
  r-seqlogo
)
optdepends=(
  r-biocstyle
  r-bsgenome
  r-bsgenome.dmelanogaster.ucsc.dm3
  r-gtools
  r-knitr
  r-motifdb
  r-parallel
  r-pwmenrich.dmelanogaster.background
  r-pwmenrich.hsapiens.background
  r-pwmenrich.mmusculus.background
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d00106ba428551053a4563c8b96e548cacc7f95a0b4d7143e263ada5096e320b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
