# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R.devices
_pkgver=2.17.0
pkgname=r-${_pkgname,,}
pkgver=2.17.0
pkgrel=4
pkgdesc='Unified Handling of Graphics Devices'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-base64enc
  r-r.methodss3
  r-r.oo
  r-r.utils
)
optdepends=(
  r-cairo
  r-digest
  r-r.rsp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c2d4b12949e0faab414c9f7575e39ee9dbf50ea12d858143df529f15ea365fb6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
