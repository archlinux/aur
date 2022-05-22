# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=transmission-makepkg
pkgver=1.0
pkgrel=1
pkgdesc="makepkg download agent for magnet URIs"
arch=('any')
url="https://aur.archlinux.org/packages/transmission-makepkg"
depends=('python' 'transmission-cli')
license=("AGPL3")
source=("transmission-makepkg"
	"transmission-quit"
	"makepkg.conf")
sha256sums=("bdf35e94c95c9da70894f4aec35747e86e6f4920101def8d4f14f3d83bd9a0a7"
	    "b07e32b4c1424d8e62adf5c05acd02e82be0a6549c49879aebeaa813b4840411"
	    "849a4b3b5f574105f4b5e4afac7c1b16cebd805c8a3ba22910a30a432cc679c6")

package() {
  local _dest="${pkgdir}/usr/share/${pkgname}"
  local _bin="${pkgdir}/usr/bin"
  mkdir -p "${_dest}"
  mkdir -p "${_bin}"
  install -Dm755 "${pkgname}" "${_bin}"
  install -Dm755 "transmission-quit" "${_bin}"
  install -Dm644 "makepkg.conf" "${_dest}"
}
