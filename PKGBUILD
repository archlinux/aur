# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CellBench
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Construct Benchmarks for Single Cell Analysis Methods'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocfilecache
  r-biocgenerics
  r-biocparallel
  r-dplyr
  r-glue
  r-lubridate
  r-magrittr
  r-memoise
  r-purrr
  r-rappdirs
  r-rlang
  r-singlecellexperiment
  r-tibble
  r-tidyr
  r-tidyselect
)
optdepends=(
  r-biocstyle
  r-covr
  r-ggplot2
  r-knitr
  r-limma
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3a64c8a103ae3d9065f8b575e84effbeb6327e5c875525ca107cb77decf883eb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
