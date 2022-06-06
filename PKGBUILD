# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geNetClassifier
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
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
sha256sums=('e03892355bdf3dab7842e1b8b7ebbc09ba11cf26fc34466768fe5800cbad07ce')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
