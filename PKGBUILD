# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sagenhaft
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=1.68.0
pkgrel=1
pkgdesc='Collection of functions for reading and comparing SAGE libraries'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-sparsem
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('959490bce306015ef0ce834a595800d8eb085b3a051e99b3b234e303f67c0942')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
