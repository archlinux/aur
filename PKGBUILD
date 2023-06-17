# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=RcppSpdlog
_pkgver=0.0.13
pkgname=r-${_pkgname,,}
pkgver=0.0.13
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
sha256sums=('73dc2c33ec7a9d5b8ffa7270cc2f32a9c75cd98ce990126e86018c43009c8984')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
