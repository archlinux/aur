# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rbokeh
_pkgver=0.5.2
pkgname=r-${_pkgname,,}
pkgver=0.5.2
pkgrel=4
pkgdesc='R Interface for Bokeh'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-digest
  r-gistr
  r-hexbin
  r-htmlwidgets
  r-jsonlite
  r-lazyeval
  r-magrittr
  r-maps
  r-pryr
  r-scales
)
optdepends=(
  r-data.table
  r-knitr
  r-lattice
  r-latticeextra
  r-lintr
  r-markdown
  r-rmarkdown
  r-roxygen2
  r-shiny
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d8c47dbd978efce04e5676a3a91d511517a9bb8fe1859c404bfc9ee0f0bf4ec0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
