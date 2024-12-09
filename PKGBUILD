# system requirements: C++11, libpng
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggiraph
_pkgver=0.8.11
pkgname=r-${_pkgname,,}
pkgver=0.8.11
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
  r-ggplot2
  r-htmltools
  r-htmlwidgets
  r-purrr
  r-rcpp
  r-rlang
  r-systemfonts
  r-uuid
  r-vctrs
)
optdepends=(
  r-dplyr
  r-gdtools
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
sha256sums=('d1be7370d583716b68a62a2afd7281395df764b246dd5fc2f9cd47d9922fbf8e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
