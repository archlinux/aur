# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ADaCGH2
_pkgver=2.54.0
pkgname=r-${_pkgname,,}
pkgver=2.54.0
pkgrel=1
pkgdesc='Analysis of big data from aCGH experiments using parallel computing and ff objects'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-acgh
  r-bit
  r-dnacopy
  r-ff
  r-tilingarray
  r-waveslim
)
optdepends=(
  r-cairo
  r-cghregions
  r-limma
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('05fbc6ff553afd8fb7d5fef3e7ca9fb4ced94ca584d03687cda4a4dfbe9e21fc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
