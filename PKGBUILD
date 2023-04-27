# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hierGWAS
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Asessing statistical significance in predictive GWA studies'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-fastcluster
  r-fmsb
  r-glmnet
)
optdepends=(
  r-biocgenerics
  r-mass
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('40a40fbc9bbf9641a0f7e9a897df912c7269e8bd83470d322f4c8d7ab563cfa5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
