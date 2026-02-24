# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=hotkey-hub
pkgver=3.1.3
tag=v3.1.3
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
sha256sums=('235b4c6b5721aa017f0c70fe0d6959f01bac81fc1d7b373f341c9f6d505aa5b1'
            'd95cfc19944287a67590922fabbc4e017b952ab22ee7d633947cc12bc19c7fd5'
            '6d2bc1020bc397a7ae3d7573e5b591abd2f993b32d5c048456b91e7c8ee4c7cf'
            '7c15292265d013dfc084c38cd1feabc282f26d55b21e1fdfb8d0485837b24d9d'
            'cf3262f4f2717e7cf5fa57007b80dbbf678fa1f6cba006a17348d0d33c75e08b'
            '45614c48e71198124b5d7e63694abce3a4c8e4653f2c71038071d36fd05e1e50'
            '15f05da3ea770e4eefcea31a85ff371bf0fcbebaa87b926d0e1dc70aa7edca24')

package() {
  install -D -m755 "${srcdir}/hotkey-hub-${tag}" "${pkgdir}/usr/bin/hotkey-hub"
  install -D -m644 "${srcdir}/hotkey-hub.service" "${pkgdir}/usr/lib/systemd/user/hotkey-hub.service"
  install -D -m644 "${srcdir}/config.jsonc" "${pkgdir}/usr/share/hotkey-hub/config-example.jsonc"
  install -D -m644 "${srcdir}/CONFIG.md-${tag}" "${pkgdir}/usr/share/hotkey-hub/CONFIG.md"
  install -D -m644 "${srcdir}/json-schema.json-${tag}" "${pkgdir}/usr/share/hotkey-hub/json-schema.json"
  install -D -m644 "${srcdir}/macros-schema.json-${tag}" "${pkgdir}/usr/share/hotkey-hub/macros-schema.json"
}
