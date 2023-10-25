# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Chicago
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
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
sha256sums=('685874023acbc6499d1bd4beb743fba55c3e3a24c33504a066123c55d0e997d5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
