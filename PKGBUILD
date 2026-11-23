# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=webchem
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=2.0.0
pkgrel=1
pkgdesc='Chemical Information from the Web'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-base64enc
  r-curl
  r-data.tree
  r-dbi
  r-digest
  r-dplyr
  r-hoardr
  r-httr
  r-jsonlite
  r-purrr
  r-rlang
  r-rsqlite
  r-rvest
  r-stringr
  r-tibble
  r-tidyr
  r-xml2
)
optdepends=(
  r-covr
  r-knitr
  r-plot.matrix
  r-rcdk
  r-rmarkdown
  r-robotstxt
  r-testthat
  r-usethis
  r-vcr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8d39ea762277d3c9312ac8a6e50fd21f8b0f07541ef16db77180f611d6661200')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
