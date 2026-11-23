# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rvest
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=1.0.5
pkgrel=2
pkgdesc='Easily Harvest (Scrape) Web Pages'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-cli
  r-glue
  r-httr
  r-lifecycle
  r-magrittr
  r-rlang
  r-selectr
  r-tibble
  r-withr
  r-xml2
)
optdepends=(
  r-covr
  r-knitr
  r-readr
  r-repurrrsive
  r-rmarkdown
  r-spelling
  r-stringi
  r-testthat
  r-webfakes
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1e7c34a0b4467887195b1cd66388919989e82ca096d08df283c675d87e53bc00')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
