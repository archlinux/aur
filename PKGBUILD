# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ggVennDiagram
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=1.2.2
pkgrel=1
pkgdesc="A 'ggplot2' Implement of Venn Diagram"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-ggplot2
  r-magrittr
  r-plotly
  r-purrr
  r-rvenn
  r-sf
  r-tibble
  r-yulab.utils
)
optdepends=(
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
  r-tidyr
  r-venn
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('939c0bd3e7c01c87560a9dd938cfc46ac7bd52a56147d9464f58b053998d8cd0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
