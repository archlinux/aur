# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstatsConvert
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
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
sha256sums=('b6e85967c3a38c9583f803d65cc798748ce12f324e8e157fd93a4ff76cd9b543')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
