# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggwordcloud
_pkgver=0.5.0
pkgname=r-${_pkgname,,}
pkgver=0.5.0
pkgrel=4
pkgdesc="A Word Cloud Geom for 'ggplot2'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-colorspace
  r-ggplot2
  r-png
  r-rcpp
  r-scales
)
optdepends=(
  r-covr
  r-dplyr
  r-ggrepel
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyr
  r-wordcloud
  r-wordcloud2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c83644335fda3fafa57263bb28dd1e1c6b4c9d68b0e4594de5490e8dc6112957')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
