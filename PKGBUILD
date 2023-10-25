# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HSMMSingleCell
_pkgver=1.21.0
pkgname=r-${_pkgname,,}
pkgver=1.21.0
pkgrel=1
pkgdesc='Single-cell RNA-Seq for differentiating human skeletal muscle myoblasts (HSMM)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('62788df1d3e5f7ac0612111b9f799919bff86c88f37d95e493197970c2280163')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
