# Maintainer: mrFrok <https://github.com/mrFrok>
pkgname=lfff-bin
pkgver=2.0.0
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
  "lfff-linux-x86_64.tar.gz::https://github.com/mrFrok/LibreFastbootFirmwareFlasher/releases/download/v$pkgver/lfff-linux-x86_64.tar.gz"
  "lfff-gui-linux-x86_64.tar.gz::https://github.com/mrFrok/LibreFastbootFirmwareFlasher/releases/download/v$pkgver/lfff-gui-linux-x86_64.tar.gz"
)
source_aarch64=(
  "lfff-linux-aarch64.tar.gz::https://github.com/mrFrok/LibreFastbootFirmwareFlasher/releases/download/v$pkgver/lfff-linux-aarch64.tar.gz"
  "lfff-gui-linux-aarch64.tar.gz::https://github.com/mrFrok/LibreFastbootFirmwareFlasher/releases/download/v$pkgver/lfff-gui-linux-aarch64.tar.gz"
)
sha256sums_x86_64=('SKIP' 'SKIP')
sha256sums_aarch64=('SKIP' 'SKIP')

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
