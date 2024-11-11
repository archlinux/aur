# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=RcppSpdlog
_pkgver=0.0.19
pkgname=r-${_pkgname,,}
pkgver=0.0.19
pkgrel=1
pkgdesc="R and C++ Interfaces to 'spdlog' C++ Header Library for Logging"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-simplermarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5d784a58a842c85a5ced460086d296889945644bd01bf8c314199ce0cf6d2c56')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
