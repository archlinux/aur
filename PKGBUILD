# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PepsNMR
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Pre-process 1H-NMR FID signals'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-gridextra
  r-matrixstats
  r-ptw
  r-reshape2
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-pepsnmrdata
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9dcdf060cf9c5e952d1ff36aad890dd2b2da7e6b377bdc10621fcf6e63ed0413')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
