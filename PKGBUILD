# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DT
_pkgver=0.23
pkgname=r-${_pkgname,,}
pkgver=0.23
pkgrel=1
pkgdesc="A Wrapper of the JavaScript Library 'DataTables'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-crosstalk
  r-htmltools
  r-htmlwidgets
  r-jquerylib
  r-jsonlite
  r-magrittr
  r-promises
)
optdepends=(
  r-bslib
  r-knitr
  r-rmarkdown
  r-shiny
  r-testit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('360ae2fcb1141125a1b16448570fc37d14c4dd3f78a872c26df4fda1787cdc70')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
