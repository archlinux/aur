# system requirements: C++17, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epialleleR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=3
pkgdesc='Fast, Epiallele-Aware Methylation Reporter'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bh
  r-biocgenerics
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-rcpp
  r-rhtslib
  r-stringi
  r-summarizedexperiment
  r-variantannotation
  r-zlibbioc
  gcc
  make
)
optdepends=(
  r-ggplot2
  r-ggstance
  r-gridextra
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f8150b3dc3c693f0c7a4ddaf0d77dcff70965d1b6c6041e5ebd6b6537545e505')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
