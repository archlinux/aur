# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bioassayR
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Cross-target analysis of small molecule bioactivity'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-chemminer
  r-dbi
  r-rjson
  r-rsqlite
  r-xml
)
optdepends=(
  r-biocstyle
  r-biomart
  r-cellhts2
  r-ggplot2
  r-knitcitations
  r-knitr
  r-knitrbootstrap
  r-rcurl
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7971768804509f75b3e6bb4751dc1a378f9e5c1bfcccbc7fb877be9bba1f9b9f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
