# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyTree
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgver=0.3.1
pkgrel=3
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
  r-data.tree
  r-shinytest
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('46babd24da24de9211e1a4ddbaf48a3b60dbd8a1695dddbedf2ca5dd9e762e4f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
