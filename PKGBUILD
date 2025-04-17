# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geNetClassifier
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
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
sha256sums=('0cc37c0d97564579b2c838c3832f9d6333d165a24c842f8e3c32dbb82d3a58f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
