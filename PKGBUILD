# system requirements: C++14
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DIAlignR
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=2.8.0
pkgrel=1
pkgdesc='Dynamic Programming Based Alignment of MS2 Chromatograms'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-bit64
  r-data.table
  r-dbi
  r-dplyr
  r-ggplot2
  r-magrittr
  r-mzr
  r-phangorn
  r-pracma
  r-rcpp
  r-rcppeigen
  r-reticulate
  r-rlang
  r-rmsnumpress
  r-rsqlite
  r-signal
  r-tidyr
  r-zoo
  gcc
)
optdepends=(
  r-akima
  r-biocparallel
  r-biocstyle
  r-gridextra
  r-knitr
  r-lattice
  r-latticeextra
  r-rmarkdown
  r-scales
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('de217f5796a61361f28381c48a634a39a648f15bff83811bc4613fc8b317baba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
