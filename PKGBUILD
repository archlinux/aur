# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fastLiquidAssociation
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='functions for genome-wide application of Liquid Association'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-doparallel
  r-hmisc
  r-impute
  r-liquidassociation
  r-preprocesscore
  r-wgcna
)
optdepends=(
  r-gostats
  r-org.sc.sgd.db
  r-yeastcc
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('337fde5977cf1876f05d562e63b97a4c04a65a794ca9fb3a3f319c2fac051cae')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
