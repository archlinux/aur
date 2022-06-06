# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=enviPat
_pkgver=2.4
pkgname=r-${_pkgname,,}
pkgver=2.4
pkgrel=4
pkgdesc='Isotope Pattern, Profile and Centroid Calculation for Mass Spectrometry'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a0857fdf1a2f206b66bb097a4188d95164edd7c0b9765016219440ceab3c6bbf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
