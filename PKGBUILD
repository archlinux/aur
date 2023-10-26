# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneRegionScan
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
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
sha256sums=('468eabcd0bb1925a9204b3a89a6184b40e6bad266464ea106a97eb80ae7d09ff')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
