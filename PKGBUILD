# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=rstatix
_pkgver=0.7.1
pkgname=r-${_pkgname,,}
pkgver=0.7.1
pkgrel=1
pkgdesc='Pipe-Friendly Framework for Basic Statistical Tests'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-broom
  r-car
  r-corrplot
  r-dplyr
  r-generics
  r-magrittr
  r-purrr
  r-rlang
  r-tibble
  r-tidyr
  r-tidyselect
)
optdepends=(
  r-boot
  r-coin
  r-emmeans
  r-ggpubr
  r-graphics
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('530563ef3fa74ebfeb3df4d771022e44ceb4fee720f558ff3b5c2259030f0030')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
