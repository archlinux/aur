# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=hotkey-hub
pkgver=1.1.0
tag=v1.1.1
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
  "hotkey-hub::${url}/releases/download/${tag}/hotkey-hub.elf"
  "CONFIG.md::${url}/releases/download/${tag}/CONFIG.md"
  "json-schema.json::${url}/releases/download/${tag}/json-schema.json"
  "macros-schema.json::${url}/releases/download/${tag}/macros-schema.json"
  "hotkey-hub.service"
  "hotkey-hub.install"
)
options=(!strip)
sha256sums=('2700d5dd1842b85ca750428332122901f54c3967644617e265d3e1205b970aa0'
            '84485c5b299bffd19e1c2ff2fac43cd8bfdb51ed1a67d9bd7709bc5986cfc61b'
            '1daa810fce31c3627999f25f93baf14cb39c62f6ed24906e7ab51fc4b1ef94d6'
            'd97dc3944a7c2ed5e548650b25172701975ac4958d5f85e17b2e5123c93fdfb1'
            'd87c6e98ae4d04c97153bf49d2569b07e732bbad8650cb95e4286877a08e01fe'
            'e0c7dabc3ea99aa217ba9bca18d53d60fe24ea0077b919b7211ced74d9d718e9')

package() {
  install -D -m755 "${srcdir}/hotkey-hub" "${pkgdir}/usr/bin/hotkey-hub"
  install -D -m644 "${srcdir}/hotkey-hub.service" "${pkgdir}/usr/lib/systemd/user/hotkey-hub.service"
  install -D -m644 "${srcdir}/CONFIG.md" "${pkgdir}/usr/share/hotkey-hub/CONFIG.md"
  install -D -m644 "${srcdir}/json-schema.json" "${pkgdir}/usr/share/hotkey-hub/json-schema.json"
  install -D -m644 "${srcdir}/macros-schema.json" "${pkgdir}/usr/share/hotkey-hub/macros-schema.json"
}
