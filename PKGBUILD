# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=log4r
_pkgver=0.4.2
pkgname=r-${_pkgname,,}
pkgver=0.4.2
pkgrel=4
pkgdesc="A Fast and Lightweight Logging System for R, Based on 'log4j'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
)
optdepends=(
  r-futile.logger
  r-httr
  r-jsonlite
  r-knitr
  r-lgr
  r-logger
  r-logging
  r-loggit
  r-microbenchmark
  r-rlog
  r-rmarkdown
  r-rsyslog
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('924a020565dcd05a2bc8283285fcae60f6b58b35e1be7c55acc0c703c7edfe34')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
