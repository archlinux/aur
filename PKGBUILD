# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=survcomp
_pkgver=1.60.1
pkgname=r-${_pkgname,,}
pkgver=1.60.1
pkgrel=1
pkgdesc='Performance Assessment and Comparison for Survival Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bootstrap
  r-ipred
  r-prodlim
  r-rmeta
  r-suppdists
  r-survivalroc
)
optdepends=(
  r-biobase
  r-biocmanager
  r-clinfun
  r-hmisc
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bf8163896519a544257386cd2adbef474f710cc1e36473330acce12921e5c046')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
