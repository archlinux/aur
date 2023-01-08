# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bs4Dash
_pkgver=2.2.1
pkgname=r-${_pkgname,,}
pkgver=2.2.1
pkgrel=3
pkgdesc="A 'Bootstrap 4' Version of 'shinydashboard'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bslib
  r-fresh
  r-htmltools
  r-httpuv
  r-httr
  r-jsonlite
  r-lifecycle
  r-shiny
  r-waiter
)
optdepends=(
  r-dt
  r-golem
  r-knitr
  r-rmarkdown
  r-testthat
  r-thematic
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2cdca62a5b42cc02f0997a5c912d27e207da76a0d859860a65ccab9dedd9c3e6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
