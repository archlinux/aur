# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RSEIS
_pkgver=4.2-0
pkgname=r-${_pkgname,,}
pkgver=4.2.0
pkgrel=1
pkgdesc='Seismic Time Series Analysis Tools'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rpmg
  r-rwave
)
optdepends=(
  r-stats
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('93ec391f69660fffdeee79a16b312522dada399a83a35758e69422145e682d14')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
