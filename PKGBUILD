# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LogicReg
_pkgver=1.6.4
pkgname=r-${_pkgname,,}
pkgver=1.6.4
pkgrel=4
pkgdesc='Logic Regression'
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
sha256sums=('2026081ac2e9b1a6580485dff6a98a467f6e589bb6b6f13387080656cacd2714')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
