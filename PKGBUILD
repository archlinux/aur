# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RUVcorr
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Removal of unwanted variation for gene-gene correlations and related analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-bladderbatch
  r-corrplot
  r-gridextra
  r-psych
  r-reshape2
  r-snowfall
)
optdepends=(
  r-hgu133a2.db
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('33e99d16dfa1196cd2da8cfe0558fbdc253b363117b24a968bcb49ff2b7c95bb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
