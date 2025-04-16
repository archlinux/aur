# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=M3C
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
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
sha256sums=('4124d3e194226e398e1ea92b24e71ba6adc9421eabdeb05289f09471dc102195')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
