# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sortable
_pkgver=0.4.6
pkgname=r-${_pkgname,,}
pkgver=0.4.6
pkgrel=1
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
sha256sums=('76275c7c321edee84d642e4c49bbed356b383a45511f237aef93cddf90271e12')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
