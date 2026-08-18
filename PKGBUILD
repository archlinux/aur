# Maintainer: mrFrok <https://github.com/mrFrok>
pkgname=lfff-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="Free, open-source firmware flasher for Android A/B devices — CLI + GUI (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/mrFrok/LibreFastbootFirmwareFlasher"
license=('GPL-3.0-only')
depends=('android-tools' 'libxkbcommon' 'fontconfig' 'libgl')
optdepends=(
  'aria2: firmware download support'
  'payload_dumper: OTA payload extraction (cargo install payload_dumper)'
)
provides=('lfff' 'lfff-gui')
conflicts=('lfff' 'lfff-gui-bin')

source_x86_64=(
  "lfff-${pkgver}-linux-x86_64.tar.gz::https://github.com/mrFrok/LibreFastbootFirmwareFlasher/releases/download/v$pkgver/lfff-linux-x86_64.tar.gz"
  "lfff-gui-${pkgver}-linux-x86_64.tar.gz::https://github.com/mrFrok/LibreFastbootFirmwareFlasher/releases/download/v$pkgver/lfff-gui-linux-x86_64.tar.gz"
)
source_aarch64=(
  "lfff-${pkgver}-linux-aarch64.tar.gz::https://github.com/mrFrok/LibreFastbootFirmwareFlasher/releases/download/v$pkgver/lfff-linux-aarch64.tar.gz"
  "lfff-gui-${pkgver}-linux-aarch64.tar.gz::https://github.com/mrFrok/LibreFastbootFirmwareFlasher/releases/download/v$pkgver/lfff-gui-linux-aarch64.tar.gz"
)
sha256sums_x86_64=(
  '4caca1e7861153140e171af27b01c8e9294dba7721e1c28e6031a094ddd1b4e2'
  'e9075f6dfcab497c71d0557c9e586f497fb0941d39527754563f71caa45855d8'
)
sha256sums_aarch64=(
  'd700c7250428459fbca714ca8e2e9f529fdaf20d4b1e8295c92a34d6b7007d6c'
  'ad650586741f4201075a0309e0b171186d3303fe92e8c4884ccf5d4a0010f04f'
)

source+=(
  "lfff-gui.desktop::https://raw.githubusercontent.com/mrFrok/LibreFastbootFirmwareFlasher/main/lfff-gui.desktop"
  "lfff-gui.svg::https://raw.githubusercontent.com/mrFrok/LibreFastbootFirmwareFlasher/main/lfff-gui.svg"
)
sha256sums+=('SKIP' 'SKIP')

package() {
  install -Dm755 "lfff"     "$pkgdir/usr/bin/lfff"
  install -Dm755 "lfff-gui" "$pkgdir/usr/bin/lfff-gui"
  install -Dm644 "lfff-gui.desktop" "$pkgdir/usr/share/applications/lfff-gui.desktop"
  install -Dm644 "lfff-gui.svg"     "$pkgdir/usr/share/icons/hicolor/scalable/apps/lfff-gui.svg"
}
