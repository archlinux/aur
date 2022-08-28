# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rearrr
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgver=0.3.1
pkgrel=1
pkgdesc='Rearranging Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-checkmate
  r-dplyr
  r-lifecycle
  r-plyr
  r-purrr
  r-r6
  r-rlang
  r-tibble
)
optdepends=(
  r-covr
  r-ggplot2
  r-knitr
  r-plotly
  r-testthat
  r-tidyr
  r-xpectr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('45690c3376552ea3d6e96c76eedbd5a96b883258e50b67ee3dc256f372c9e0d6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
