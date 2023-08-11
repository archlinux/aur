# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RSEIS
_pkgver=4.1-5
pkgname=r-${_pkgname,,}
pkgver=4.1.5
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
sha256sums=('494405541ec3df2cd83a605f73dddac66b5823ab7618f114876734ab73e7740b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
