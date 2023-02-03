# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=visdat
_pkgver=0.6.0
pkgname=r-${_pkgname,,}
pkgver=0.6.0
pkgrel=1
pkgdesc='Preliminary Visualisation of Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-cli
  r-dplyr
  r-forcats
  r-ggplot2
  r-glue
  r-magrittr
  r-purrr
  r-readr
  r-scales
  r-tibble
  r-tidyr
)
optdepends=(
  r-covr
  r-knitr
  r-plotly
  r-rmarkdown
  r-spelling
  r-stringr
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('104acdbb9d41167b861ab24de0e1e1e14f61c1b476bac112fcbc6e47c157e598')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
