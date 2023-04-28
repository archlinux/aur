# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname="ipfs-dlagent"
pkgver=0.1
pkgrel=1
pkgdesc="makepkg download agent for IPFS URIs."
arch=('any')
url="https://aur.archlinux.org/packages/ipfs-dlagent"
depends=("kubo")
license=("AGPL3")
source=("ipfs-dlagent.sh"
        "ipfs-dlagent-quit.sh"
        "makepkg.conf")
sha256sums=("1ed4b75322a7476ec8e6f32095ba32b9e5771d27107fa80d7f5d5814a9bbdbc2" 
            "bdb2bb9ba5bf96f7eba0cb7945a7ffdd94eca57544c11098c2c309dab5a781a9"
            "499743e52fb5d3d7fec5f26d1aa560a76d6f89858335182cd67748df7e4f63a1")

package() {
  local _dest="${pkgdir}/usr/share/${pkgname}"
  local _bin="${pkgdir}/usr/bin"
  install -Dm755 "${pkgname}.sh" "${_bin}/${pkgname}"
  install -Dm755 "${pkgname}-quit.sh" "${_bin}/${pkgname}-quit"
  install -Dm644 "makepkg.conf" "${_dest}"
}
