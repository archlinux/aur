# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ICS
_pkgver=1.3-1
pkgname=r-${_pkgname,,}
pkgver=1.3.1
pkgrel=4
pkgdesc='Tools for Exploring Multivariate Data via ICS/ICA'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-mvtnorm
  r-survey
)
optdepends=(
  r-icsnp
  r-mass
  r-pixmap
  r-robustbase
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9106f6bf89c57af44e89ea174150376e6dfba861cd78fcd0f26f45f637e46c74')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
