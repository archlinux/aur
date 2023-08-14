# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ggVennDiagram
_pkgver=1.2.3
pkgname=r-${_pkgname,,}
pkgver=1.2.3
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
sha256sums=('f26c4977d868cef80a3ce80ea418130415ac4106336d4172c5638cd130c87820')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
