# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ParallelLogger
_pkgver=3.5.1
pkgname=r-${_pkgname,,}
pkgver=3.5.1
pkgrel=1
pkgdesc='Support for Parallel Computation, Logging, and Function Automation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-jsonlite
  r-memuse
  r-rstudioapi
  r-snow
  r-xml2
)
optdepends=(
  r-dt
  r-knitr
  r-rmarkdown
  r-sendmailr
  r-shiny
  r-testthat
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fa96b9cb568c5cda21fa4dd283f555cd7e98bb1eebd01c58ba1412740062a46c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
