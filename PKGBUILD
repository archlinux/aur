# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Iso
_pkgver=0.0-18.1
pkgname=r-${_pkgname,,}
pkgver=0.0.18.1
pkgrel=4
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
sha256sums=('2fa5f78a7603cbae94a5e38e791938596a053d48c609a7c120a19cbb7d93c66f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
