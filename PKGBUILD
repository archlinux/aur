# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqcombo
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
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
sha256sums=('f84a695efad85ed4f1ec35736ea1be295894484b5cf90a0c83de159ac9bf3c85')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
