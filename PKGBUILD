# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CellMapper
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Predict genes expressed selectively in specific cell types'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-s4vectors
)
optdepends=(
  r-all
  r-biobase
  r-biocstyle
  r-cellmapperdata
  r-experimenthub
  r-humanaffydata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9bef07abde4a48a08e40991c52cb98a6e55d3cbb79fcdf20b1bb60c5019f49e5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
