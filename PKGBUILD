# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RImmPort
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='RImmPort: Enabling Ready-for-analysis Immunology Research Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-dbi
  r-dplyr
  r-plyr
  r-reshape2
  r-rsqlite
  r-sqldf
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ae00f810943c04d09ed9ee7a25bf48e36480c68b3fb5fce0ba57cfc60930c22b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
