# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=enviPat
_pkgver=2.6
pkgname=r-${_pkgname,,}
pkgver=2.6
pkgrel=1
pkgdesc='Isotope Pattern, Profile and Centroid Calculation for Mass Spectrometry'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fc6756c465a47337ccbd715bf84e4c8cdfe9eb38623cd6c37ca799e590a7199f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
