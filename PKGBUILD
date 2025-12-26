# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=hotkey-hub
pkgver=1.1.0
commit=98bf098
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
  "hotkey-hub::${url}/releases/download/${commit}/app.elf"
  "CONFIG.md::${url}/releases/download/${commit}/CONFIG.md"
  "json-schema.json::${url}/releases/download/${commit}/json-schema.json"
  "macros-schema.json::${url}/releases/download/${commit}/macros-schema.json"
  "hotkey-hub.service"
  "hotkey-hub.install"
)
options=(!strip)
sha256sums=(
  '3679b641b0ab7b7ed549f7a463c53cd91687eccc08d5f683c024794ac6d3fcc5'
  'd7954b165044696869c0709a46301f096b7e4cf99e5f8b68eaf74431e04d18d8'
  'd7f63dac3ccfa16538485fe48b1de8536eaf64215fab9c88ab8bcb53d5e0936d'
  'e2b67947f1d5bb4cbd903a2676037f7211c46ed7627753d84f1b85911aff4fe8'
  'SKIP'
  'SKIP'
)

package() {
  install -D -m755 "${srcdir}/hotkey-hub" "${pkgdir}/usr/bin/hotkey-hub"
  install -D -m644 "${srcdir}/hotkey-hub.service" "${pkgdir}/usr/lib/systemd/user/hotkey-hub.service"
  install -D -m644 "${srcdir}/CONFIG.md" "${pkgdir}/usr/share/hotkey-hub/CONFIG.md"
  install -D -m644 "${srcdir}/json-schema.json" "${pkgdir}/usr/share/hotkey-hub/json-schema.json"
  install -D -m644 "${srcdir}/macros-schema.json" "${pkgdir}/usr/share/hotkey-hub/macros-schema.json"
}