# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=styler
_pkgver=1.9.1
pkgname=r-${_pkgname,,}
pkgver=1.9.1
pkgrel=1
pkgdesc='Non-Invasive Pretty Printing of R Code'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-cli
  r-magrittr
  r-purrr
  r-r.cache
  r-rlang
  r-rprojroot
  r-vctrs
  r-withr
)
optdepends=(
  r-data.tree
  r-digest
  r-dplyr
  r-here
  r-knitr
  r-prettycode
  r-rmarkdown
  r-roxygen2
  r-rstudioapi
  r-testthat
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c80fa3c062f007645ec820b5b087d4d5784e7797cc88d030ab59fb5823ded0bb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
