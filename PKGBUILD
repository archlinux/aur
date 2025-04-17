# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rtreemix
_pkgver=1.69.0
pkgname=r-${_pkgname,,}
pkgver=1.69.0
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
sha256sums=('10e1efa644673f7e05ed1dcdb6ad09f0d040594d0095ae92139f17206da480eb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
