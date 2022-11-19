# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=extRemes
_pkgver=2.1-3
pkgname=r-${_pkgname,,}
pkgver=2.1.3
pkgrel=1
pkgdesc='Extreme Value Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-distillery
  r-lmoments
)
optdepends=(
  r-fields
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e1ccf0dd542502eb9775682ff64ed358fce4aec271b98cd746e58fbfcf093c40')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
