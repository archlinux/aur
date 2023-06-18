# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=spdl
_pkgver=0.0.5
pkgname=r-${_pkgname,,}
pkgver=0.0.5
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
sha256sums=('2d7a888eec3f582df61ba7a2dcf27cbf886dc3696cdf6e44c04c1da638fdb8a0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
