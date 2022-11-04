# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowUtils
_pkgver=1.59.0
pkgname=r-${_pkgname,,}
pkgver=1.59.0
pkgrel=4
pkgdesc='Utilities for flow cytometry'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-corpcor
  r-flowcore
  r-graph
  r-runit
  r-xml
)
optdepends=(
  r-gatingmldata
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('46d4295df433797feb9b7ce8f285a87b5a08d19a383c8397a6b2a6859b30a387')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
