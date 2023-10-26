# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MOSim
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Multi-Omics Simulation (MOSim)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-dplyr
  r-ggplot2
  r-hiddenmarkov
  r-iranges
  r-lazyeval
  r-matrixstats
  r-purrr
  r-rlang
  r-s4vectors
  r-scales
  r-stringi
  r-stringr
  r-tibble
  r-tidyr
  r-zoo
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('49152fdac7d284e3a2c5c8fc19960e813157fb78911a71bb20a118bee69c9d5f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
