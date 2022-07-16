# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_uuid="org.archlinux.aur.multiuser"
pkgname="multi-user"
pkgver=1.0
pkgrel=1
pkgdesc="Access control for running graphical applications as other users."
arch=('any')
# url="http://${pkgname}.sourceforge.net/linux.html"
depends=("dconf"
	 "xorg-xhost")
license=("AGPL3")
install="${pkgname}.install"
source=("${pkgname}"
	"${pkgname}.desktop"
	"${pkgname}.gschema.xml")
sha256sums=("SKIP"
	    "SKIP"
	    "SKIP")

# shellcheck disable=SC2154
package(){
  local _dest="${pkgdir}/etc/xdg/autostart"
  local _lib_dest="${pkgdir}/usr/lib/${pkgname}"
  local _schemas_dest="${pkgdir}/usr/share/glib-2.0/schemas"
  # install -dm 755 "${_dest}"
  # install -dm 755 "${_dest}"
  install -Dm 644 "${pkgname}.desktop" "${_dest}/${pkgname}.desktop"
  install -Dm 644 "${pkgname}.gschema.xml" "${_schemas_dest}/${_uuid}.gschema.xml"
  install -Dm 755 "${pkgname}" "${_lib_dest}/${pkgname}"
}
