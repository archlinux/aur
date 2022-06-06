# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyAce
_pkgver=0.4.2
pkgname=r-${_pkgname,,}
pkgver=0.4.2
pkgrel=1
pkgdesc='Ace Editor Bindings for Shiny'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-jsonlite
  r-shiny
)
optdepends=(
  r-dplyr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4a997ebbc78b0a7672635968f9543f94b8924b52f4dfc16e3059f76c60dbb88a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
