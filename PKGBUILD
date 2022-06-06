# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyHeatmaply
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=0.2.0
pkgrel=3
pkgdesc="Deploy 'heatmaply' using 'shiny'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-heatmaply
  r-htmltools
  r-plotly
  r-readxl
  r-rmarkdown
  r-shiny
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0416b64aa4f9f45e00be46cb43250b1da414f95cc03178855778a6b5773becd8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
