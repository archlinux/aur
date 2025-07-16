# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=webchem
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=1.3.1
pkgrel=1
pkgdesc='Chemical Information from the Web'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-base64enc
  r-data.tree
  r-dplyr
  r-httr
  r-jsonlite
  r-purrr
  r-rlang
  r-rvest
  r-stringr
  r-tibble
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
sha256sums=('8d2323fbe1d3a5710d233ff50d75e16d2fe9cbb43062f617ee4f971feffd78f5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
