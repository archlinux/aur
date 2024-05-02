# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeqVarTools
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Tools for variant data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-data.table
  r-gdsfmt
  r-genomicranges
  r-gwasexacthw
  r-iranges
  r-logistf
  r-s4vectors
  r-seqarray
)
optdepends=(
  r-biocstyle
  r-runit
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fe5d89902b14e86cdb439502396bc38275dae6319b1e0f5dd8c196548258a3d7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
