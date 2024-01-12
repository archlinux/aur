# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rintrojs
_pkgver=0.3.4
pkgname=r-${_pkgname,,}
pkgver=0.3.4
pkgrel=1
pkgdesc="Wrapper for the 'Intro.js' Library"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('AGPL')
depends=(
  r
  r-jsonlite
  r-shiny
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d428201d7e9e5f18161f5a941506c2fb22cc58dde6eb6542a261040307242489')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
