# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyTree
_pkgver=0.2.7
pkgname=r-${_pkgname,,}
pkgver=0.2.7
pkgrel=4
pkgdesc='jsTree Bindings for Shiny'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-htmlwidgets
  r-jsonlite
  r-promises
  r-shiny
  r-stringr
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4387f11f47fd24f260b53224a884101156964944d68dee8583674f761513dd49')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
