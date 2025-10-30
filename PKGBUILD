# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=M3C
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Monte Carlo Reference-based Consensus Clustering'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-corpcor
  r-doparallel
  r-dosnow
  r-foreach
  r-ggplot2
  r-matrixcalc
  r-rtsne
  r-umap
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bfe4a279f1a37dc491e961d7820a34d896fbc107d0dd9fc0a206270813c2b43c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
