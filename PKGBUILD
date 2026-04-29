# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geNetClassifier
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
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
sha256sums=('cbe37108f214124612f75da18a6fdd1e473a2f9e675f7d760c15478130bc7d23')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
