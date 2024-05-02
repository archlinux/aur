# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cytoKernel
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Differential expression using kernel-based score test'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ashr
  r-biocparallel
  r-circlize
  r-complexheatmap
  r-data.table
  r-dplyr
  r-magrittr
  r-rcpp
  r-rlang
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c68f6f58ff7e1fc5fc02d80ad9fc7b2095e6f2f7fd9d82e1f715180675d7ec5f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
