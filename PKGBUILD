# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CARNIVAL
_pkgver=2.10.0
pkgname=r-${_pkgname,,}
pkgver=2.10.0
pkgrel=1
pkgdesc='A CAusal Reasoning tool for Network Identification (from gene expression data) using Integer VALue programming'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-igraph
  r-lpsolve
  r-readr
  r-rjson
  r-rmarkdown
  r-stringr
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-refmanager
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2940c4547d7d8f0ed5752b855b2f5015a9f60b9e01b3050f4bbc2f0dbb693db7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
