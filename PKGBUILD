# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=beadarraySNP
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=1.62.0
pkgrel=1
pkgdesc='Normalization and reporting of Illumina SNP bead arrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-quantsmooth
)
optdepends=(
  r-acgh
  r-affy
  r-beadarray
  r-dnacopy
  r-limma
  r-snapcgh
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('01a8b1ea932b180ddf8e8218192c9cff940cc2291119d3b219a6b451bbac0738')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
