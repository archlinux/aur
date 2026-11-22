# Maintainer: zevaryx <zevaryx@gmail.com>
pkgname=rettui-desktop-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Reticulum client in a window of its own (rettui's web UI): LXMF messaging, NomadNet browsing and hosting, and RRC chat"
arch=('x86_64' 'aarch64')
url="https://github.com/rettui-dev/rettui"
license=('LicenseRef-Reticulum')
depends=('glibc' 'gcc-libs' 'gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('rettui-desktop')
conflicts=('rettui-desktop')
source_x86_64=("https://github.com/rettui-dev/rettui/releases/download/v${pkgver}/rettui-desktop-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/rettui-dev/rettui/releases/download/v${pkgver}/rettui-desktop-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5ddb034ad0f81d5ec22626410b70441ceed3a30f4684e73ed328d03953244ee1')
sha256sums_aarch64=('c9146d6d0ba8fe6aad32dbe28b02419f79027aa388a3c2ae347a559c8c2b6502')

package() {
  cd "rettui-desktop-v${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 rettui-desktop "$pkgdir/usr/bin/rettui-desktop"
  install -Dm644 rettui-desktop.desktop "$pkgdir/usr/share/applications/rettui-desktop.desktop"
  install -Dm644 rettui-desktop.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/rettui-desktop.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/rettui-desktop/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/rettui-desktop/LICENSE"
}
