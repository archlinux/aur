# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MACSr
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
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
sha256sums=('39b7dab057ae881796831dc2f252e74c088c9e974507703afbc5d26f28c3b2fb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
