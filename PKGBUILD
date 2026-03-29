# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=vcdExtra
_pkgver=0.9.3
pkgname=r-${_pkgname,,}
pkgver=0.9.3
pkgrel=1
pkgdesc="'vcd' Extensions and Additions"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ca
  r-dplyr
  r-glue
  r-gnm
  r-gt
  r-here
  r-purrr
  r-readxl
  r-rgl
  r-scales
  r-stringr
  r-tidyr
  r-vcd
  r-igraph
  r-webshot2
)
optdepends=(
  r-aer
  r-car
  r-coin
  r-effects
  r-fahrmeir
  r-ggplot2
  r-gmodels
  r-hmisc
  r-knitr
  r-lattice
  r-lmtest
  r-nnet
  r-plyr
  r-rgl
  r-rmarkdown
  r-seriation
  r-sleuth2
  r-stats4
  r-vgam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9e7110df0f46ae462e14c334f16e439faaa9a0c19796f75ee863e8cbce27e71c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
