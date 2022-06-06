# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sortable
_pkgver=0.4.5
pkgname=r-${_pkgname,,}
pkgver=0.4.5
pkgrel=4
pkgdesc="Drag-and-Drop in 'shiny' Apps with 'SortableJS'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-ellipsis
  r-htmltools
  r-htmlwidgets
  r-jsonlite
  r-learnr
  r-rlang
  r-shiny
)
optdepends=(
  r-base64
  r-covr
  r-knitr
  r-magrittr
  r-rmarkdown
  r-spelling
  r-testthat
  r-webshot
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a37d6739041d088a167f0d542b75b54aa565aa284f00869b69ec169b66667ec5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
