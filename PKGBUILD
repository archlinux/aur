# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aCGH
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=1.82.0
pkgrel=1
pkgdesc='Classes and functions for Array Comparative Genomic Hybridization data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-multtest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a07604c059dc520178b0ac599f3d30d08b65928f1e17c7c63bd60cca6e9ac01')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
