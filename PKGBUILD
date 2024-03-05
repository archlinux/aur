# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=naniar
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=1.1.0
pkgrel=1
pkgdesc='Data Structures, Summaries, and Visualisations for Missing Data'
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
  r-norm
  r-purrr
  r-rlang
  r-tibble
  r-tidyr
  r-upsetr
  r-vctrs
  r-viridis
  r-visdat
)
optdepends=(
  r-covr
  r-gridextra
  r-here
  r-hmisc
  r-imputets
  r-knitr
  r-rmarkdown
  r-rpart
  r-rpart.plot
  r-simputation
  r-spelling
  r-testthat
  r-vdiffr
  r-wakefield
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a94c46c3a78893bd935a0a51adb6a523915afb35427a56ce650b1e1ab28c6f44')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
