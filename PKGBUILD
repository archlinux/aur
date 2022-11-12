# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=naniar
_pkgver=0.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Data Structures, Summaries, and Visualisations for Missing Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
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
  r-viridis
  r-visdat
)
optdepends=(
  r-covr
  r-gdtools
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
sha256sums=('d546ca15bf6c224f3103eb1441abef91d34feebb7320c2398d598f5d50177450')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
