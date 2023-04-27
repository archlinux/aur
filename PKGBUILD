# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oppti
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Outlier Protein and Phosphosite Target Identifier'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-devtools
  r-ggplot2
  r-knitr
  r-limma
  r-paralleldist
  r-pheatmap
  r-rcolorbrewer
  r-reshape
)
optdepends=(
  r-markdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0b70c8db9806331174a4d884232c5730d334467352d883b10405c9905830187a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
