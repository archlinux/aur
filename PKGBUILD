# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MACSr
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='MACS: Model-based Analysis for ChIP-Seq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-annotationhub
  r-basilisk
  r-experimenthub
  r-reticulate
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-knitr
  r-macsdata
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('30bff462b6b8a6ce8520115ad55060decc91e9d3c0b60e4b38d231209afe65d4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
