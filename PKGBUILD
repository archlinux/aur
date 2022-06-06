# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hipathia
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=2.12.0
pkgrel=1
pkgdesc='HiPathia: High-throughput Pathway Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationhub
  r-coin
  r-delayedarray
  r-igraph
  r-limma
  r-matrixstats
  r-multiassayexperiment
  r-preprocesscore
  r-s4vectors
  r-servr
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('50a7c8166c0b97169c907fffc541c98f6d3048fca9093b495f6c4a1250f5ef95')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
