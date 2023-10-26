# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=procoil
_pkgver=2.30.0
pkgname=r-${_pkgname,,}
pkgver=2.30.0
pkgrel=1
pkgdesc='Prediction of Oligomerization of Coiled Coil Proteins'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-kebabs
  r-s4vectors
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c12e4cddd0bf40648d0bc19b94e8fc7c22d6753e8deebdca62630ca9c7901a08')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
