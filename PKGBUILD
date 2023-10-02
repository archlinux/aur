# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Iso
_pkgver=0.0-21
pkgname=r-${_pkgname,,}
pkgver=0.0.21
pkgrel=1
pkgdesc='Functions to Perform Isotonic Regression'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b6842ae1c7b629ebb63355f50bb2e5d96e5696fa59590807ac6028b6dce28fa6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
