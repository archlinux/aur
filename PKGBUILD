# Maintainer: Uffe Jakobsen <uffe@uffe.org>

_pkgname_main=sigrok-firmware
_pkgname_sub=sysclk-lwla


pkgname=${_pkgname_main}-${_pkgname_sub}
pkgver=0.1
pkgrel=2
pkgdesc="Firmware for SysClk LWLA-1016/1034 logic analysers"
arch=(any)
url="http://sigrok.org/wiki/Sysclk_LWLA1034"
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
