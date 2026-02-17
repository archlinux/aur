# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=hotkey-hub
pkgver=3.0.1
tag=v3.0.1
pkgrel=1
pkgdesc="Allows to control remote PC (mouse/windows/keyboard/processses) using hotkeys on this pc"
arch=('x86_64')
url="https://github.com/akoidan/hotkey-hub"
license=('MIT')
depends=(
  gcc-libs
  libsm
  libxext
)
optdepends=(
  'http-remote-pc-control: allows to control remote pc'
)

install=hotkey-hub.install
source=(
  "hotkey-hub-${tag}::${url}/releases/download/${tag}/hotkey-hub.elf"
  "CONFIG.md-${tag}::${url}/releases/download/${tag}/CONFIG.md"
  "json-schema.json-${tag}::${url}/releases/download/${tag}/json-schema.json"
  "macros-schema.json-${tag}::${url}/releases/download/${tag}/macros-schema.json"
  "hotkey-hub.service"
  "config.jsonc"
  "hotkey-hub.install"
)
options=(!strip)
sha256sums=('375e9812627229b85eb61c8995fcead4d2f0983525fd93dbab14d11198211561'
            'd95cfc19944287a67590922fabbc4e017b952ab22ee7d633947cc12bc19c7fd5'
            '6d2bc1020bc397a7ae3d7573e5b591abd2f993b32d5c048456b91e7c8ee4c7cf'
            '7c15292265d013dfc084c38cd1feabc282f26d55b21e1fdfb8d0485837b24d9d'
            'cd12426f68aaf21b9421ed3deace0808b5795fc1f843f030b5a24f039929c55e'
            '45614c48e71198124b5d7e63694abce3a4c8e4653f2c71038071d36fd05e1e50'
            '81a0dbd5847c0866c8dadfbb9d47d06e5763e70c9b935d7c0069186bee537061')

package() {
  install -D -m755 "${srcdir}/hotkey-hub-${tag}" "${pkgdir}/usr/bin/hotkey-hub"
  install -D -m644 "${srcdir}/hotkey-hub.service" "${pkgdir}/usr/lib/systemd/user/hotkey-hub.service"
  install -D -m644 "${srcdir}/config.jsonc" "${pkgdir}/usr/share/hotkey-hub/config-example.jsonc"
  install -D -m644 "${srcdir}/CONFIG.md-${tag}" "${pkgdir}/usr/share/hotkey-hub/CONFIG.md"
  install -D -m644 "${srcdir}/json-schema.json-${tag}" "${pkgdir}/usr/share/hotkey-hub/json-schema.json"
  install -D -m644 "${srcdir}/macros-schema.json-${tag}" "${pkgdir}/usr/share/hotkey-hub/macros-schema.json"
}
