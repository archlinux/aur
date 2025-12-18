# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R.devices
_pkgver=2.17.3
pkgname=r-${_pkgname,,}
pkgver=2.17.3
pkgrel=1
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
sha256sums=('4fa070d83781774e69c8ec5f4b3ffb3751f0d3f292271cdb47d76b0c012f3cf8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
