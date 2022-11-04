# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bcellViper
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Human B-cell transcriptional interactome and normal human B-cell expression data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d585962175484d3f985ad057b5787c50e0ef2dbc8dbd1a3bd8c864d1c181efba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
