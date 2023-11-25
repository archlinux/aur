# system requirements: C++11; for AWS S3 support on Linux, libcurl andopenssl (optional)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrow
_pkgver=14.0.0.1
pkgname=r-${_pkgname,,}
pkgver=14.0.0.1
pkgrel=1
pkgdesc="Integration to 'Apache' 'Arrow'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  arrow
  r-assertthat
  r-bit64
  r-cpp11
  r-glue
  r-purrr
  r-r6
  r-rlang
  r-tidyselect
  r-vctrs
)
optdepends=(
  libcurl-compat
  openssl
  r-blob
  r-cli
  r-dbi
  r-dbplyr
  r-decor
  r-distro
  r-dplyr
  r-duckdb
  r-hms
  r-jsonlite
  r-knitr
  r-lubridate
  r-pillar
  r-pkgload
  r-reticulate
  r-rmarkdown
  r-stringi
  r-stringr
  r-sys
  r-testthat
  r-tibble
  r-tzdb
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5d771169d57fcf4cc1f6dd38dad92683692cf67d30668c5b3da47cc5c5a4927a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
