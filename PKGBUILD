# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneRegionScan
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
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
sha256sums=('6a9f6960e353c009fd93a11c90a979ddc284789e62cfb9ea14271b9df6d1b8fc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
