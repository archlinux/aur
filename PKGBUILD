# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Chicago
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='CHiCAGO: Capture Hi-C Analysis of Genomic Organization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-data.table
  r-delaporte
  r-hmisc
  r-matrixstats
)
optdepends=(
  r-annotationhub
  r-argparser
  r-biocstyle
  r-genomicinteractions
  r-genomicranges
  r-iranges
  r-knitr
  r-pchicdata
  r-rmarkdown
  r-rsamtools
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('24d52421edc7161f4d2384a86d0ace83ebca0f0ea553069a11ab3baf3bf7b215')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
