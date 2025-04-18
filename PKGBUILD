# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneRegionScan
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
pkgrel=1
pkgdesc='GeneRegionScan'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affxparser
  r-biobase
  r-biostrings
  r-rcolorbrewer
  r-s4vectors
)
optdepends=(
  r-affy
  r-annotationdbi
  r-bsgenome
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('df20d6aa4f27805d3c8f7cdff27cbb1dcfc122b3eec22f632296efd693acd1fd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
