# system requirements: C++17, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mosbi
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
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
sha256sums=('771f159821c6986f4cb6600b23d3a613b9a99bc6f2121ef3d01ed994a79f8902')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
