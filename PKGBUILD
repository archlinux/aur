# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebus.unicode
_pkgver=0.0-2
pkgname=r-${_pkgname,,}
pkgver=0.0.2
pkgrel=4
pkgdesc="Unicode Extensions for the 'rebus' Package"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Unlimited')
depends=(
  r
  r-rebus.base
)
optdepends=(
  r-stringi
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b5c9cf237174fdfc0598bc35fdb8a35ffd0ee5452737d79a32f77e02f908a3a0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
