# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RSEIS
_pkgver=4.1-1
pkgname=r-${_pkgname,,}
pkgver=4.1.1
pkgrel=3
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
sha256sums=('4534dfd056af8efab0adc6d8c0934ba6f01af1983b73524cc58f1bf86fab12a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
