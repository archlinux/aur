# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=visdat
_pkgver=0.6.1
pkgname=r-${_pkgname,,}
pkgver=0.6.1
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
sha256sums=('388d46ed56e8e2b887279d72a7016906899c3ba141072d7db6429c547a0e1201')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
