# system requirements: Java
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rmelting
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='R Interface to MELTING 5'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-rdpack
  r-rjava
)
optdepends=(
  r-knitr
  r-pander
  r-readxl
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('148f1ffe4ffd0d5f08a50925c3d38ff8e3438b314faf760355ae63a86057aa22')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
