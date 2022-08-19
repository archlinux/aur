# system requirements: C++11, libpng
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggiraph
_pkgver=0.8.3
pkgname=r-${_pkgname,,}
pkgver=0.8.3
pkgrel=1
pkgdesc="Make 'ggplot2' Graphics Interactive"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-htmltools
  r-htmlwidgets
  r-purrr
  r-rcpp
  r-rlang
  r-systemfonts
  r-uuid
  gcc
  libpng
)
optdepends=(
  r-dplyr
  r-ggrepel
  r-hexbin
  r-knitr
  r-maps
  r-quantreg
  r-rmarkdown
  r-sf
  r-shiny
  r-tinytest
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('398b73a474176061ff77ae36bb9dd9049d9bbd9f00a10affa3eedf685ff5056f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
