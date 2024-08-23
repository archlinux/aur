# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ParallelLogger
_pkgver=3.3.1
pkgname=r-${_pkgname,,}
pkgver=3.3.1
pkgrel=1
pkgdesc='Support for Parallel Computation, Logging, and Function Automation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-jsonlite
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
sha256sums=('874933e4e8da4004338355fb316c6b85adeb79c09ed27a07a1f2c65d94f6c315')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
