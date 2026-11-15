# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=whatsatui-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Personal WhatsApp terminal client with a cyan Ratatui interface (prebuilt binary)"
arch=('x86_64')
url="https://github.com/wuzi/whatsatui"
license=('MIT')
depends=('gcc-libs' 'glibc')
optdepends=('mpv: voice-message and video playback'
            'ffmpeg: GIF previews'
            'xdg-utils: open links and downloaded files'
            'wl-clipboard: Wayland copy/paste'
            'xclip: X11 copy/paste'
            'xsel: X11 copy/paste alternative')
provides=('whatsatui')
conflicts=('whatsatui')
source=("whatsatui-$pkgver-x86_64.tar.gz::https://github.com/9M2PJU/whatsatui/releases/download/v$pkgver/whatsatui-$pkgver-x86_64.tar.gz")
sha256sums=('359df0f77dd50b862b87c5e347c620b5dba3d2292c2c48e62db1a5f06adcc825')

package() {
  install -Dm755 whatsapp-tui "$pkgdir/usr/bin/whatsapp-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
  install -Dm644 whatsapp-tui.desktop "$pkgdir/usr/share/applications/whatsapp-tui.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/whatsapp-tui.svg"
}
