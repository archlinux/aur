# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ppiStats
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=1.62.0
pkgrel=4
pkgdesc='Protein-Protein Interaction Statistical Package'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-category
  r-graph
  r-rcolorbrewer
)
optdepends=(
  r-ppidata
  r-scisi
  r-xtable
  r-yeastexpdata
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('01a9a0f95d0abb2d32d28bf064eb08a087cebc89c8ba2239e9a07801959baf70')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
