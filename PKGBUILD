# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=webchem
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=1.1.2
pkgrel=4
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
sha256sums=('b72fee1b862b554626a79ac4dc37c62dd19ab6041393cc0328dd72f36f7ebfd1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
