# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=apComplex
_pkgver=2.70.0
pkgname=r-${_pkgname,,}
pkgver=2.70.0
pkgrel=1
pkgdesc='Estimate protein complex membership using AP-MS protein data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-graph
  r-org.sc.sgd.db
  r-rbgl
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1a7b97b5ac5d659496948616156637f42abc87cb86dbe58e6b70a15c74cb58bb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
