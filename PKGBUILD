# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maftools
_pkgver=2.18.0
pkgname=r-${_pkgname,,}
pkgver=2.18.0
pkgrel=1
pkgdesc='Summarize, Analyze and Visualize MAF Files'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-data.table
  r-rcolorbrewer
  r-rhtslib
  r-zlibbioc
  make
  r-dnacopy
)
optdepends=(
  r-berryfunctions
  r-biostrings
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-curl
  r-genomicranges
  r-iranges
  r-knitr
  r-mclust
  r-multiassayexperiment
  r-nmf
  r-pheatmap
  r-r.utils
  r-raggedexperiment
  r-rmarkdown
  r-s4vectors
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ea8d5c1d97a0d1b7d5ab172ee93b89c234918874b98ae3b2ff8d8ed02da6bc08')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
