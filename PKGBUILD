# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hierGWAS
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
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
sha256sums=('f7a72d8cd4957b0ac4a1a7931ba7fc9690f5018e7a135cbd3786fa40373f1a90')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
