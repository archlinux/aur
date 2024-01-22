# Maintainer: Uffe Jakobsen <uffe@uffe.org>

_pkgname_main=sigrok-firmware
_pkgname_sub=asix-sigma


pkgname=${_pkgname_main}-${_pkgname_sub}
pkgver=0.1
pkgrel=2
pkgdesc="Firmware for Asix Sigma logic analysers"
arch=(any)
url="http://sigrok.org/wiki/ASIX_SIGMA"
license=(LicenseRef-custom)
depends=()
makedepends=(git)

source=("git://sigrok.org/${_pkgname_main}.git")
sha512sums=(SKIP)

package() {
  cd ${srcdir}/${_pkgname_main}/${_pkgname_sub}
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE.* "${pkgdir}/usr/share/licenses/${pkgname}/"
  mkdir -p "${pkgdir}/usr/share/${_pkgname_main}"
  cp LICENSE.* ${_pkgname_sub}* "${pkgdir}/usr/share/${_pkgname_main}/"
}
