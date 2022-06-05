# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=decoupleR
_pkgver=2.2.2
pkgname=r-${_pkgname,,}
pkgver=2.2.2
pkgrel=3
pkgdesc='decoupleR: Inferring biological activities from omics data using a collection of methods'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-aucell
  r-broom
  r-dplyr
  r-fgsea
  r-gsva
  r-magrittr
  r-purrr
  r-ranger
  r-rlang
  r-robustrankaggreg
  r-speedglm
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyselect
  r-viper
  r-withr
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-pkgdown
  r-refmanager
  r-rmarkdown
  r-roxygen2
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('354d165e9c6f0bf5211966242c63a797117ed2a78867f44b54a8f335b8473c60')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
