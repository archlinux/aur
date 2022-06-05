# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DECIPHER
_pkgver=2.24.0
pkgname=r-${_pkgname,,}
pkgver=2.24.0
pkgrel=1
pkgdesc='Tools for curating, analyzing, and manipulating biological sequences'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-dbi
  r-iranges
  r-rsqlite
  r-s4vectors
  r-xvector
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('059fbb6df17a7e5dc0e6bd4b95677c44cd4babcd30ef9f3dfc3ee0f7dd12b810')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
