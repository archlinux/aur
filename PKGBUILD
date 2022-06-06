# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAdecay
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Maximum Likelihood Decay Modeling of RNA Degradation Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-gplots
  r-nloptr
  r-scales
  r-tmb
)
optdepends=(
  r-knitr
  r-parallel
  r-reshape2
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('85f8c78ec9a6e0f16cf117edc9b49f6bb51a4b29015565046109fb813a3c7b6a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
