# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRNAmeConverter
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Convert miRNA Names to Different miRBase Versions'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-dbi
  r-mirbaseversions.db
  r-reshape2
)
optdepends=(
  r-knitr
  r-methods
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('57af5a5f1036b1f881f3f824946a19c716952d3868edd4639d20484fe9c80a6b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
