# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=netOmics
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Multi-Omics (time-course) network-based integration and interpretation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-dplyr
  r-ggplot2
  r-go.db
  r-gprofiler2
  r-igraph
  r-magrittr
  r-minet
  r-purrr
  r-randomwalkrestartmh
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-mixomics
  r-rmarkdown
  r-testthat
  r-tidyverse
  r-timeomics
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cd4b2aa397a1c1f4c42fec41d1532ce0a7c356e8b101e9a2d38d4291d996de0e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
