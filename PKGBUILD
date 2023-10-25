# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=beadarraySNP
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=1.68.0
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
sha256sums=('fafee5b78dc49205f8d252cb65aa91324897e1851d83389fe061ffeb0efc31ef')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
