# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fastLiquidAssociation
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
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
sha256sums=('55e5b2299283c60c7efd24230d1611fca1740484e2ce46254ca5507301bdfebf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
