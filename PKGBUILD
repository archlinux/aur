# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstatsConvert
_pkgver=1.16.1
pkgname=r-${_pkgname,,}
pkgver=1.16.1
pkgrel=1
pkgdesc='Import Data from Various Mass Spectrometry Signal Processing Tools to MSstats Format'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-checkmate
  r-data.table
  r-log4r
  r-stringi
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fe3f8f7ac196e605f31bec9be4e37b54ef6253daaee5f4e5941699376010e765')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
