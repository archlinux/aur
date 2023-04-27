# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geNetClassifier
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Classify diseases and build associated gene networks using gene expression profiles'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-e1071
  r-ebarrays
  r-minet
)
optdepends=(
  r-biocgenerics
  r-igraph
  r-infotheo
  r-leukemiaseset
  r-rcolorbrewer
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d6ca6f3fba3b8706829656d66ef7cbb55f5459d4abf5a1c1fdf8d5ca2582c7ae')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
