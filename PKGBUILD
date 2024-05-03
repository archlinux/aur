# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ArrayExpress
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
pkgrel=1
pkgdesc='Access the ArrayExpress Microarray Database at EBI and build Bioconductor data structures: ExpressionSet, AffyBatch, NChannelSet'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-httr
  r-jsonlite
  r-limma
  r-oligo
  r-rlang
)
optdepends=(
  r-affy
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('245fe1654c6aae4fe4d1e6a318f92ca99e8114d4c7e6ceeda82913102f80a6a9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
