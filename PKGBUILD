# system requirements: xml2, GNU make, C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowDensity
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Sequential Flow Cytometry Data Gating'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-car
  r-flowcore
  r-flowviz
  r-flowworkspace
  r-gplots
  r-rfoc
  r-rgeos
  r-sp
  libxml2
  make
  gcc
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2586286e86772b8460b38ec19ad926ada97e3158393abd51347f14079ed5e1bc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
