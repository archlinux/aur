# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=beadarraySNP
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
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
sha256sums=('cf48b69396914afa206b3a35586f5a099dcc075b2916e70b97dd2fca6e421e1a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
