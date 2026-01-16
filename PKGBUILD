# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=hotkey-hub
pkgver=2.0.0
tag=v2.0.0
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
sha256sums=('6464329e3c85dd10bafc9bd5d328c51118a8942f31c7f4b550ced9e42665e645'
            'c26a067fa9ede2b70ee1a9068e279695d869ab1cae5d2f5ae77cda42ef6ec1c8'
            '93915f995cb9c45139bcb248a7b575e2030490b08c24bdb483795f8ef5ba95b8'
            'e543a7854d4aa1ab9de7f1706887bff51a39e5e04a09fd1a5844713e2cc34e48'
            'd87c6e98ae4d04c97153bf49d2569b07e732bbad8650cb95e4286877a08e01fe'
            'e0c7dabc3ea99aa217ba9bca18d53d60fe24ea0077b919b7211ced74d9d718e9')

package() {
  install -D -m755 "${srcdir}/hotkey-hub" "${pkgdir}/usr/bin/hotkey-hub"
  install -D -m644 "${srcdir}/hotkey-hub.service" "${pkgdir}/usr/lib/systemd/user/hotkey-hub.service"
  install -D -m644 "${srcdir}/CONFIG.md" "${pkgdir}/usr/share/hotkey-hub/CONFIG.md"
  install -D -m644 "${srcdir}/json-schema.json" "${pkgdir}/usr/share/hotkey-hub/json-schema.json"
  install -D -m644 "${srcdir}/macros-schema.json" "${pkgdir}/usr/share/hotkey-hub/macros-schema.json"
}
