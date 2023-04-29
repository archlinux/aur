# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellHTS2
_pkgver=2.64.0
pkgname=r-${_pkgname,,}
pkgver=2.64.0
pkgrel=1
pkgdesc='Analysis of cell-based screens - revised version of cellHTS'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-category
  r-genefilter
  r-gseabase
  r-hwriter
  r-locfit
  r-rcolorbrewer
  r-splots
  r-vsn
)
optdepends=(
  r-ggplot2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3c1cceb8536c67858e91a14d954d81126deec6d2060a8ee44bda1135e9135d2e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
