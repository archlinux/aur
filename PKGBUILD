# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=hotkey-hub
pkgver=3.4.1
tag=v3.4.1
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
  "hotkey-hub.service"
  "config.jsonc"
  "hotkey-hub.install"
)
options=(!strip)
sha256sums=('f096e3b51a77e44dc13105c905ea65369dc8c6f29a0d1e6c488519a0e8a0ff9d'
            '79a0a0eff8bfee6b4a2f66426a170e32b246ea9846056301484f2f5c10f50e0d'
            '3739f90458ab81671003348a52dd40ffd96999b4c2fb2113c68f6bfb2ca2d956'
            'f2975dc0cd4832c721ec886922b78716d64e274bbd09c1c0084a28abd42c618f'
            '45614c48e71198124b5d7e63694abce3a4c8e4653f2c71038071d36fd05e1e50'
            '15f05da3ea770e4eefcea31a85ff371bf0fcbebaa87b926d0e1dc70aa7edca24')

package() {
  install -D -m755 "${srcdir}/hotkey-hub-${tag}" "${pkgdir}/usr/bin/hotkey-hub"
  install -D -m644 "${srcdir}/hotkey-hub.service" "${pkgdir}/usr/lib/systemd/user/hotkey-hub.service"
  install -D -m644 "${srcdir}/config.jsonc" "${pkgdir}/usr/share/hotkey-hub/config-example.jsonc"
  install -D -m644 "${srcdir}/CONFIG.md-${tag}" "${pkgdir}/usr/share/hotkey-hub/CONFIG.md"
  install -D -m644 "${srcdir}/json-schema.json-${tag}" "${pkgdir}/usr/share/hotkey-hub/json-schema.json"
}
