# system requirements: jQuery, jQueryUI, qTip2, D3js and Raphael arerequired Javascript libraries made available via the onlineCDNJS service (http://cdnjs.cloudflare.com).
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RGraph2js
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Convert a Graph into a D3js Script'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-digest
  r-graph
  r-rjson
  r-whisker
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-runit
  r-sna
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c7fb6de30b29264f8da68b35c64657c72313b2abe2e87c80640a8f18fd4bc146')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
