# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=vars
_pkgver=1.5-9
pkgname=r-${_pkgname,,}
pkgver=1.5.9
pkgrel=1
pkgdesc='VAR Modelling'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-lmtest
  r-sandwich
  r-strucchange
  r-urca
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('285e5f9faee703f5f337d50bf4ba24524501910d1a0cffe7d1f77e0de2167cac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
