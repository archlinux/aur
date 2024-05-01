# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DiffLogo
_pkgver=2.28.0
pkgname=r-${_pkgname,,}
pkgver=2.28.0
pkgrel=1
pkgdesc='DiffLogo: A comparative visualisation of biooligomer motifs'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cba
)
optdepends=(
  r-knitr
  r-motifdb
  r-seqlogo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5271c2cc9f4a2d3f83697e4687168c06c0bc0f6e29fb56c6474efd1af32c8701')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
