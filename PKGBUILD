# system requirements: C++11, libpng
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggiraph
_pkgver=0.9.7
pkgname=r-${_pkgname,,}
pkgver=0.9.7
pkgrel=1
pkgdesc="Make 'ggplot2' Graphics Interactive"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  gcc
  libpng
  ttf-dejavu
  # or it will fail to be built, see https://github.com/davidgohel/ggiraph/blob/master/R/fonts.R
  r
  r-cli
  r-dplyr
  r-gdtools
  r-ggplot2
  r-htmltools
  r-htmlwidgets
  r-purrr
  r-rcpp
  r-rlang
  r-s7
  r-systemfonts
  r-vctrs
)
optdepends=(
  r-ggbeeswarm
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
sha256sums=('9eb748d31858d632f26bf646d0d43423e79e5a1150050b1a91159d8b5e66abce')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
