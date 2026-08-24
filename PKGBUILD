# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=survivalAnalysis
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=0.4.0
pkgrel=2
pkgdesc='High-Level Interface for Survival Analysis and Associated Plots'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-cowplot
  r-dplyr
  r-forcats
  r-ggplot2
  r-gridextra
  r-magrittr
  r-purrr
  r-rlang
  r-scales
  r-stringr
  r-survminer
  r-tibble
  r-tidyr
  r-tidytidbits
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-tidyverse
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2b4cedf72f33cb55f7845f940459aef5d0028b0526e8ff3da3ae06f178b954a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
