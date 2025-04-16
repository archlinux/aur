# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqcombo
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
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
sha256sums=('2e4f562042d25608ae5d90c730b8e30e2a4350d6b34f6c25f31ba2c6902f7dcd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
