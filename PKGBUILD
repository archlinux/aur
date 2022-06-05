# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CARNIVAL
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=2.6.0
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
  r-tidyr
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('19a33992d6e760651139e51846d00003767e2d35940be42314bba67d65141c2c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
