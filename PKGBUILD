# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metabomxtr
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='A package to run mixture models for truncated metabolomics data with normal or lognormal distributions'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocparallel
  r-formula
  r-ggplot2
  r-multtest
  r-optimx
  r-plyr
)
optdepends=(
  r-reshape2
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bce78c31a01d25cdbd2f7b7bf18d8158b3d8a82c148be9f42c2b9cf6425a027c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
