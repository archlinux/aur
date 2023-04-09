# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=transmission-dlagent
pkgver=1.0
pkgrel=1
pkgdesc="makepkg download agent for magnet URIs"
arch=('any')
url="https://aur.archlinux.org/packages/transmission-dlagent"
depends=('python' 'transmission-cli')
license=("AGPL3")
source=("transmission-dlagent"
	"transmission-quit"
	"makepkg.conf")
sha256sums=("bbd98794f4e542817d81107cd5dd648384b856667f26cb281468008dfaa2019e"
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
