# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=hotkey-hub
pkgver=3.3.1
tag=v3.3.1
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
sha256sums=('74beba7ca35c6a126b08ed9953b2c1ff9a11ceba69d8af00442aaf6eb3df02ca'
            '4fe3027a8474bcecca064c9aac30367b7d82508f9302f69f1b90fa492cda8769'
            'faf0eae9acf2c8a1c03ec603e862ad5f993e1855586657c80cde3e86fe5499d8'
            'e4e992f12ae3a95875efd8caeb591ecfb5ad0c6e0d3c157061a2eafefee91bae'
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
