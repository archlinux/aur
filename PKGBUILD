# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=osfr
_pkgver=0.2.9
pkgname=r-${_pkgname,,}
pkgver=0.2.9
pkgrel=3
pkgdesc="Interface to the 'Open Science Framework' ('OSF')"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-crul
  r-fs
  r-httr
  r-jsonlite
  r-memoise
  r-purrr
  r-rlang
  r-stringi
  r-tibble
)
optdepends=(
  r-brio
  r-covr
  r-dplyr
  r-knitr
  r-lintr
  r-logger
  r-rmarkdown
  r-rprojroot
  r-spelling
  r-testthat
  r-vcr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ac78ff916bbcf0eec13bbb23d7555537c49a6b54763fed229f4bdc48a179733d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
