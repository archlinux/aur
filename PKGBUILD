# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rtreemix
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=1.62.0
pkgrel=1
pkgdesc='Rtreemix: Mutagenetic trees mixture models.'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-graph
  r-hmisc
)
optdepends=(
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e319a079a8c32c44931a8994c03e7a686ead852c4f42e631f14c06978d91f411')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
