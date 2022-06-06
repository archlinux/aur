# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SigFuge
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='SigFuge'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomicranges
  r-ggplot2
  r-matlab
  r-reshape
  r-sigclust
)
optdepends=(
  r-biocstyle
  r-org.hs.eg.db
  r-prebsdata
  r-rsamtools
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8f7563e7cedf6392f894d6206d8e543e71f2ec897276dba84c5f90b30c9d17cf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
