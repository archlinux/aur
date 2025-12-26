# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneRegionScan
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=1.66.0
pkgrel=1
pkgdesc='GeneRegionScan'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affxparser
  r-biobase
  r-biostrings
  r-rcolorbrewer
  r-s4vectors
)
optdepends=(
  r-affy
  r-annotationdbi
  r-bsgenome
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('02ae7dd33a5ce1179cabe02b91a5bb40e1bdc42d26d1746c57a726a5ba4eead4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
