# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RUVcorr
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
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
sha256sums=('f8509e425fe47c6ea62b192c56f1046a9272e7787480858990d4ada1b7d2fed7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
