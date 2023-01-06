# system requirements: C++11; for AWS S3 support on Linux, libcurl andopenssl (optional)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrow
_pkgver=10.0.1
pkgname=r-${_pkgname,,}
pkgver=10.0.1
pkgrel=5
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
sha256sums=('1edc641ec9ed8b1b8aa762e56f282c47fde2f03584bc69542463f383758a8d37')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
