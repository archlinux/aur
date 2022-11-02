# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CellMapper
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
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
sha256sums=('ec26ca86da606a162cb76a06742b58391ecf133ba5f052fda61a8557e6af4b9c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
