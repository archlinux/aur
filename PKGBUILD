# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=spdl
_pkgver=0.0.4
pkgname=r-${_pkgname,,}
pkgver=0.0.4
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
sha256sums=('2002c70b5af577db0b3d731f90b4dd549886d0173b559deb05225c8257ed1ee0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
