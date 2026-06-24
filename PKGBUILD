# Maintainer: Edwar Diaz <edwardiaz.dev@gmail.com>

pkgname=cliprithm-bin
pkgver=1.3.4
pkgrel=2
pkgdesc="Prebuilt Cliprithm AppImage packaged for Arch Linux"
arch=('x86_64')
url="https://github.com/BOTOOM/Cliprithm"
license=('MIT')
depends=('ffmpeg' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'webkit2gtk-4.1')
optdepends=('xdg-desktop-portal: improved desktop integration for file dialogs and portals')
provides=('cliprithm')
conflicts=('cliprithm')
source=("Cliprithm_1.3.4_amd64.AppImage::https://github.com/BOTOOM/Cliprithm/releases/download/cliprithm-v1.3.4/Cliprithm_1.3.4_amd64.AppImage" "cliprithm.png::https://raw.githubusercontent.com/BOTOOM/Cliprithm/cliprithm-v1.3.4/src-tauri/icons/128x128.png" "LICENSE::https://raw.githubusercontent.com/BOTOOM/Cliprithm/cliprithm-v1.3.4/LICENSE" "cliprithm" "cliprithm.desktop")
sha256sums=('46668e9e266575c3fd438581f8556ec24cf94dda9e48795edae851942118c9a9' 'c7f874d897675e666ae09da79dfefeed2aa5bf9f51da33bf931050c5087b6a80' 'd90660ef692577f22ad72ccabe19ff6d10c4047d5a8345bf748f0c044932b52c' '1fea6d5a7f002eb5b9c4d6cddd045cfbc13358061e896916e37a215613d148ae' 'fc1f073620a6ea5283c288a5870941eea57dc2369b691c0788ec8fb16260045f')
noextract=('Cliprithm_1.3.4_amd64.AppImage')
options=('!strip')

package() {
  install -Dm755 "$srcdir/Cliprithm_1.3.4_amd64.AppImage" "$pkgdir/opt/cliprithm/cliprithm.AppImage"
  install -Dm644 "$srcdir/cliprithm.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/cliprithm.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 "$srcdir/cliprithm" "$pkgdir/usr/bin/cliprithm"
  install -Dm644 "$srcdir/cliprithm.desktop" "$pkgdir/usr/share/applications/cliprithm.desktop"
}
