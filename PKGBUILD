# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gh
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=1.3.0
pkgrel=4
pkgdesc="'GitHub' 'API'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-cli
  r-gitcreds
  r-httr
  r-ini
  r-jsonlite
)
optdepends=(
  r-covr
  r-knitr
  r-mockery
  r-rmarkdown
  r-rprojroot
  r-spelling
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a44039054e8ca56496f2d9c7a10cdadf4a7383bc91086e768ba7e7f1fbcaed1c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
