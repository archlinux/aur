# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggprism
_pkgver=1.0.3
pkgname=r-${_pkgname,,}
pkgver=1.0.3
pkgrel=4
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
sha256sums=('57324fcd31c084cc11fedb63ba399aa76ec1a4e23a9bb95a89c1e8925106b025')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
