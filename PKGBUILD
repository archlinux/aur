# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=RcppSpdlog
_pkgver=0.0.15
pkgname=r-${_pkgname,,}
pkgver=0.0.15
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
sha256sums=('c334244c6db7cb88059ba4b4279a3c75742b814a0883bb1ed4cd4e33fcaf5568')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
