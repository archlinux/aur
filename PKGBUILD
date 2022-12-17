# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=spdl
_pkgver=0.0.3
pkgname=r-${_pkgname,,}
pkgver=0.0.3
pkgrel=1
pkgdesc="Wrapper for 'RcppSpdlog' Functions"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcppspdlog
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08b8d763aa4c68fe475c97a9f01f3fc3d3992dfc7c09f7786f41800430f01509')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
