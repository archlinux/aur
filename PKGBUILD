# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneRegionScan
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
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
sha256sums=('8573daa6274119cc043d2156e25afb96cf396b0f218a7abe967124061595ee61')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
