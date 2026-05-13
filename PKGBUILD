# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=hotkey-hub
pkgver=3.3.0
tag=v3.3.0
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
sha256sums=('70a284a71ab924f06ee0ba7cbf902de819a725933dbb4770bd14a17399541dd3'
            'b0e33ff5aa2cb5736a64a28ee5ce29ba57c88cd4ee7cb91482cdf2fce8be34bc'
            '260fe6c93f7ad0d324e012df585bda84159ca0e7f5fe1d615a1e46ae65657965'
            'fa790ad3888a246fb598ce0fc6a83a91798483417b7f9474325ceda90d58205f'
            'f2975dc0cd4832c721ec886922b78716d64e274bbd09c1c0084a28abd42c618f'
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
