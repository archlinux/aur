# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggprism
_pkgver=1.0.7
pkgname=r-${_pkgname,,}
pkgver=1.0.7
pkgrel=1
pkgdesc="A 'ggplot2' Extension Inspired by 'GraphPad Prism'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-digest
  r-ggplot2
  r-glue
  r-gtable
  r-rlang
  r-scales
  r-tibble
)
optdepends=(
  r-covr
  r-dplyr
  r-ggbeeswarm
  r-ggnewscale
  r-knitr
  r-magrittr
  r-patchwork
  r-rmarkdown
  r-rstatix
  r-tidyr
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('98175b1a845d22617171476dd6f785e3843e9173e1b7517de2ce00d1506375dc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
