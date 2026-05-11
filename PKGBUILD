# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=hotkey-hub
pkgver=3.2.0
tag=v3.2.0
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
sha256sums=('33b0dffea2ea72387c25e8dc780270d6a6205e2ffa2728f11efd67d9b555047c'
            '76345a686b63c64815248e72d430ee30efa44330c8789caa97f2fa5d626907e7'
            'b26d549e4798706bf47c34caaa4d9507d7019dfaeaeaddbeab245a1ab1192484'
            '7c15292265d013dfc084c38cd1feabc282f26d55b21e1fdfb8d0485837b24d9d'
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
