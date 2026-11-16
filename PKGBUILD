# Maintainer: zevaryx <zevaryx@gmail.com>
pkgname=rettui-desktop-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Reticulum client in a window of its own (rettui's web UI): LXMF messaging, NomadNet browsing and hosting, and RRC chat"
arch=('x86_64' 'aarch64')
url="https://github.com/zevaryx/rettui"
license=('LicenseRef-Reticulum')
depends=('glibc' 'gcc-libs' 'gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('rettui-desktop')
conflicts=('rettui-desktop')
source_x86_64=("https://github.com/zevaryx/rettui/releases/download/v${pkgver}/rettui-desktop-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/zevaryx/rettui/releases/download/v${pkgver}/rettui-desktop-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('14135ab482cf59186733683dbfbe3ca56d6a388b88f4a5d7cf9ab172f402def5')
sha256sums_aarch64=('337ecb39660404c9a1949404ee7a6ae9f9eefd1b65071c01891b25f08137b80a')

package() {
  cd "rettui-desktop-v${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 rettui-desktop "$pkgdir/usr/bin/rettui-desktop"
  install -Dm644 rettui-desktop.desktop "$pkgdir/usr/share/applications/rettui-desktop.desktop"
  install -Dm644 rettui-desktop.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/rettui-desktop.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/rettui-desktop/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/rettui-desktop/LICENSE"
}
