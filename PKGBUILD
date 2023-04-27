# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=omicplotR
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Visual Exploration of Omic Datasets Using a Shiny App'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-aldex2
  r-compositions
  r-dt
  r-jsonlite
  r-knitr
  r-matrixstats
  r-rmarkdown
  r-shiny
  r-vegan
  r-zcompositions
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4d1e88b325283107da18f3f0be5cfabc5bd6557b0fedd406f09c14d6dbc5f485')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
