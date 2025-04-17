# system requirements: jQuery, jQueryUI, qTip2, D3js and Raphael arerequired Javascript libraries made available via the onlineCDNJS service (http://cdnjs.cloudflare.com).
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RGraph2js
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
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
sha256sums=('3d42e6b28729eff182a48c1c0f148f00e9e31ffe2d241747bc3e5607a9e92274')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
