# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R.devices
_pkgver=2.17.4
pkgname=r-${_pkgname,,}
pkgver=2.17.4
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
sha256sums=('d4327aa9eb8d97441ce97629e6450ef74fbcb0e0b1976040796bc9e349d6f792')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
