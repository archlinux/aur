# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCM
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Fit row-column association models with the negative binomial distribution for the microbiome'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-alabama
  r-edger
  r-ggplot2
  r-nleqslv
  r-phyloseq
  r-rcolorbrewer
  r-reshape2
  r-tensor
  r-tseries
  r-vgam
  r-dbi
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('65ccb0fc1b17d33dfcbab4824a6a89e32691d1ff135b699f314c4e9a5fa0f733')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
