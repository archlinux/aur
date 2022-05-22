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
sha256sums=("130952c1ffe57be1b82e620a243f93ee3187bb4e5616a6dc7797b2d5f0ecb8bd"
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
