# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metabomxtr
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
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
sha256sums=('a05b77d54e79093f5047e07f5b768cd8dbaf01685999d06ac3e09be40af67e40')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
