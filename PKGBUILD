# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=janitor
_pkgver=2.2.1
pkgname=r-${_pkgname,,}
pkgver=2.2.1
pkgrel=1
pkgdesc='Simple Tools for Examining and Cleaning Dirty Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-hms
  r-lifecycle
  r-lubridate
  r-magrittr
  r-purrr
  r-rlang
  r-snakecase
  r-stringi
  r-stringr
  r-tidyr
  r-tidyselect
)
optdepends=(
  r-dbplyr
  r-knitr
  r-rmarkdown
  r-rsqlite
  r-sf
  r-testthat
  r-tibble
  r-tidygraph
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('27c401302a62cafe8e68e66a51073834bc7930872282e0feb151d13629ae6cdf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
