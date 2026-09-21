pkgname=fvc-launcher-bin
pkgver=2.2.0
pkgrel=1
pkgdesc='Modern Minecraft launcher with isolated profiles and Modrinth integration'
arch=('x86_64')
url='https://github.com/FvC-Launcher/FvC-Launcher'
license=('MIT')
depends=('alsa-lib' 'fuse2' 'gtk3' 'libxcb' 'libxss' 'nss')
provides=('fvc-launcher')
conflicts=('fvc-launcher')
options=('!strip')
source=(
  "fvc-launcher-$pkgver.AppImage::https://github.com/FvC-Launcher/FvC-Launcher/releases/download/v$pkgver/FvC-Launcher-$pkgver.AppImage"
  'fvc-launcher.desktop'
  "fvc-launcher.png::https://raw.githubusercontent.com/FvC-Launcher/FvC-Launcher/v$pkgver/resources/icon.png"
)
sha256sums=(
  '876d1f54f0fbed4ed686b347e0f51273e93ee12be6bc909488db8eff41ee6ccd'
  'SKIP'
  '9717e74cc95bd7a5e7869fa12ecfc1a1855c55d35c336c9bc461bfd5a89975e3'
)

package() {
  install -Dm755 "$srcdir/fvc-launcher-$pkgver.AppImage" \
    "$pkgdir/opt/fvc-launcher/fvc-launcher"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/fvc-launcher/fvc-launcher "$pkgdir/usr/bin/fvc-launcher"
  install -Dm644 "$srcdir/fvc-launcher.desktop" \
    "$pkgdir/usr/share/applications/fvc-launcher.desktop"
  install -Dm644 "$srcdir/fvc-launcher.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/fvc-launcher.png"
}
