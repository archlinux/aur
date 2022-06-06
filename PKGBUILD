# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rhandsontable
_pkgver=0.3.8
pkgname=r-${_pkgname,,}
pkgver=0.3.8
pkgrel=4
pkgdesc="Interface to the 'Handsontable.js' Library"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-htmlwidgets
  r-jsonlite
  r-magrittr
)
optdepends=(
  r-htmltools
  r-knitr
  r-miniui
  r-rmarkdown
  r-rstudioapi
  r-shiny
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('901ed9c59936f7fa52ad8db3111c8904ab962f9c74f1b6cd40f81683af35d21d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
