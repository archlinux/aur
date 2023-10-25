# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqcombo
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Visualization Tool for Sequence Recombination and Reassortment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggplot2
  r-igraph
  r-yulab.utils
)
optdepends=(
  r-emojifont
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-tibble
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a780338f42603de0d7d8b517f456d2a65f2291e8764f19b98fb831b21767bf7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
