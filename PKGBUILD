# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ArrayExpressHTS
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='ArrayExpress High Throughput Sequencing Processing Pipeline'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biomart
  r-biostrings
  r-bitops
  r-edger
  r-genomicranges
  r-hmisc
  r-iranges
  r-r2html
  r-rcolorbrewer
  r-rhtslib
  r-rjava
  r-rsamtools
  r-sampling
  r-sendmailr
  r-shortread
  r-snow
  r-svmisc
  r-xml
  make
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c8e08db7779a56a72a6dee7c437f6dae5d3579bd0ab690bd565ff48c9bc28faf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
