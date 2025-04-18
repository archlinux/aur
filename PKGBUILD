# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=beadarray
_pkgver=2.58.0
pkgname=r-${_pkgname,,}
pkgver=2.58.0
pkgrel=1
pkgdesc='Quality assessment and low-level analysis for Illumina BeadArray data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-beaddatapackr
  r-biobase
  r-biocgenerics
  r-genomicranges
  r-ggplot2
  r-hexbin
  r-illuminaio
  r-iranges
  r-limma
  r-reshape2
)
optdepends=(
  r-affy
  r-beadarrayexampledata
  r-biocstyle
  r-ggbio
  r-gridextra
  r-hwriter
  r-illuminahumanv3.db
  r-knitr
  r-lumi
  r-nozzle.r1
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e4e2138b7d866cbfd436e955fc64c50562d010806995a432d9021fdb89af3055')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
