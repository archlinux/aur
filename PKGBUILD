# system requirements: C++17, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mosbi
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Molecular Signature identification using Biclustering'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-akmbiclust
  r-bh
  r-biclust
  r-fabia
  r-igraph
  r-isa2
  r-qubic
  r-rcolorbrewer
  r-rcpp
  r-rcppparallel
  r-xml2
  gcc
  make
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runibic
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('348c4735e2e4a7ada09149213b435d0ce219fbc926919d28eeb732893ebccd11')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
