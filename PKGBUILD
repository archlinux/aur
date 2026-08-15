# Maintainer: M0N7Y5
# Contributor: Albert Latham <me@albertlatham.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname="plasticity-bin"
pkgver=26.1.4
pkgrel=1
pkgdesc="3D modeling software for concept artists"
arch=("x86_64")
license=("LicenseRef-custom")
url='https://github.com/nkallen/plasticity'
depends=(alsa-lib at-spi2-atk at-spi2-core atk cairo dbus desktop-file-utils expat gdk-pixbuf2 glib2 gtk3 gvfs
  hicolor-icon-theme kde-cli-tools libcups libdrm libnotify libx11 libxcb libxcomposite libxdamage libxext
  libxfixes libxkbcommon libxrandr libxtst mesa nspr nss pango trash-cli xdg-utils)
optdepends=('discord: For communication with the devs'
  'apparmor: Extra protection'
  'pulseaudio: For sound')
source=(
  "https://github.com/nkallen/plasticity/releases/download/v${pkgver}/plasticity_${pkgver}_amd64.deb"
  "https://raw.githubusercontent.com/nkallen/plasticity/refs/tags/v${pkgver}/LICENSE"
)
sha512sums=('fa27fb296caaee755ef3ecce42f158533d7e7c28d1cceeff49240e7c2b9c4b8d143e178d01767caa415423bffa8ce584af99e12bbfc64329182a507ba950c8d0'
            '1fbd6b24b4022331307ee3b8266fc6eee956238b5854633071848c145a044127f6d6eadc8c07c288c4dcd16c0de10e933ff21c5d8c715c273902cdeffded4bcd')
options=(!strip)

package() {
  tar -xvf data.tar.zst -C "$pkgdir"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  echo "https://www.plasticity.xyz/eula" > "$pkgdir/usr/share/licenses/$pkgname/EULA"
}
# vim:set ts=2 sw=2 et:
