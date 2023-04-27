# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iCNV
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Integrated Copy Number Variation detection'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-codex
  r-data.table
  r-dplyr
  r-fields
  r-ggplot2
  r-rlang
  r-tidyr
  r-truncnorm
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-wes.1kg.wugsc
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dcb7e7e5f42de69cf8e65358028ff8f991fb9c6a2c23ad1b270ead463c7f7e1c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
