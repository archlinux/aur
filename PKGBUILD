# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=subSeq
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Subsampling of high-throughput sequencing count data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-data.table
  r-digest
  r-dplyr
  r-ggplot2
  r-magrittr
  r-qvalue
  r-tidyr
)
optdepends=(
  r-deseq2
  r-dexseq
  r-edger
  r-knitr
  r-limma
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('02c0f0531375c2dadf3b1c86859886eb469bb7595f7e8deb5e5ea5c355cf0878')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
