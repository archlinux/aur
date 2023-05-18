# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=DT
_pkgver=0.28
pkgname=r-${_pkgname,,}
pkgver=0.28
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
  r-future
  r-knitr
  r-rmarkdown
  r-shiny
  r-testit
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d975d57dd8523c021dbd815c8369f174aef47b9850bb4bdb9929be3d83a00d4e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
