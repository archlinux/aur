# system requirements: C++11; for AWS S3 support on Linux, libcurl andopenssl (optional)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrow
_pkgver=10.0.0
pkgname=r-${_pkgname,,}
pkgver=10.0.0
pkgrel=1
pkgdesc="Integration to 'Apache' 'Arrow'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-assertthat
  r-bit64
  r-purrr
  r-r6
  r-rlang
  r-tidyselect
  r-vctrs
  gcc
  r-cpp11
)
optdepends=(
  r-dbi
  r-dbplyr
  r-decor
  r-distro
  r-dplyr
  r-duckdb
  r-hms
  r-knitr
  r-lubridate
  r-pkgload
  r-reticulate
  r-rmarkdown
  r-stringi
  r-stringr
  r-testthat
  r-tibble
  r-withr
  libcurl-compat
  openssl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e855b5ea913e93935d20be11b342f45193437404945c9fc39e9c61fd91911a13')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
