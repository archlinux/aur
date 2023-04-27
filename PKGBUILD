# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DECIPHER
_pkgver=2.28.0
pkgname=r-${_pkgname,,}
pkgver=2.28.0
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
sha256sums=('f68894c8de856df7b9a8daea6e7712b5dbb802a0eed0f0cc2f21889cd1f4e69b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
