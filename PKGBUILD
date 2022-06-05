# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=alluvial
_pkgver=0.1-2
pkgname=r-${_pkgname,,}
pkgver=0.1.2
pkgrel=4
pkgdesc='Alluvial Diagrams'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-devtools
  r-dplyr
  r-knitr
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('77b6dc4651b33b03aaaf1e09a35f9c3536e5fddac2eda34f5a34e0ae33cf2e0d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
