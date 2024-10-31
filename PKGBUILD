# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PECA
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Probe-level Expression Change Averaging'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-aroma.affymetrix
  r-aroma.core
  r-genefilter
  r-limma
  r-preprocesscore
  r-rots
)
optdepends=(
  r-spikein
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a38ab99f34f1de105d8e0b44ce5cfa7efd2ebc5d2c2f80510ce7c252f28e9ff')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
