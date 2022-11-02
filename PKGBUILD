# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RImmPort
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
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
sha256sums=('24794d5c8b6fd67d83d67f835f2e97abf5ef4fabbddf3109df2804f87f9b9c43')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
