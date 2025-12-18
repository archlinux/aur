# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowClust
_pkgver=3.48.0
pkgname=r-${_pkgname,,}
pkgver=3.48.0
pkgrel=1
pkgdesc='Clustering for Flow Cytometry'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  make
  r
  r-biobase
  r-biocgenerics
  r-flowcore
  r-graph
)
optdepends=(
  r-flowstats
  r-flowworkspace
  r-flowworkspacedata
  r-knitr
  r-opencyto
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c1e18799839bb5628f4cf0316668f5d58480b944139955116b54756cfd309dd9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
