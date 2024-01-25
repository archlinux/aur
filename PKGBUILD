# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAdecay
_pkgver=1.22.1
pkgname=r-${_pkgname,,}
pkgver=1.22.1
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
sha256sums=('ef8684de79814e9edecd15eb9d7ceb31df2f7d43b123a1af1b30389ae4d97461')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
