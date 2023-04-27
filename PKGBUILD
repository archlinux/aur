# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ITALICSData
_pkgver=2.37.0
pkgname=r-${_pkgname,,}
pkgver=2.37.0
pkgrel=1
pkgdesc='ITALICSData'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dad8af72e46c746260f5d576f5b7bfe22a892fb86dade55cf05329dd6715ff5c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
