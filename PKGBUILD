# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epigraHMM
_pkgver=1.8.1
pkgname=r-${_pkgname,,}
pkgver=1.8.1
pkgrel=1
pkgdesc='Epigenomic R-based analysis with hidden Markov models'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-bamsignals
  r-csaw
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-ggpubr
  r-greylistchip
  r-iranges
  r-limma
  r-magrittr
  r-pheatmap
  r-rcpp
  r-rcpparmadillo
  r-rhdf5
  r-rhdf5lib
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-scales
  r-summarizedexperiment
  make
)
optdepends=(
  r-biocstyle
  r-bsgenome.rnorvegicus.ucsc.rn4
  r-chromstardata
  r-gcapc
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('12236f02c49ebbb9f91143cf9be2abb160071fa600fde28151cf003b8767ff1b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
