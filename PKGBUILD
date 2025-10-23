pkgname=xpanel-desktop-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Cross-platform Electron wrapper for Finalmouse XPANEL"
arch=('x86_64')
url="https://github.com/diegul/xpanel-desktop"
license=('MIT')
depends=('hicolor-icon-theme' 'glibc')
provides=('xpanel-desktop')
conflicts=('xpanel-desktop')
options=(!strip)
source=(
  "https://github.com/diegul/xpanel-desktop/releases/download/v${pkgver}/xpanel-desktop-${pkgver}-x86_64.AppImage"
  "xpanel-desktop.desktop"
  "xpanel-desktop.sh"
  "xpanel-desktop.png"
)
sha256sums=('77eb3967e37ad659ee0025696a3cf3a7ce41de30f0f78e4bde0b43c4084e8eaa'
            'SKIP' 'SKIP' 'SKIP')

package() {
  install -d "$pkgdir/opt/xpanel-desktop"
  install -m755 "$srcdir/xpanel-desktop-${pkgver}-x86_64.AppImage" "$pkgdir/opt/xpanel-desktop/xpanel-desktop.AppImage"

  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/xpanel-desktop.sh" "$pkgdir/usr/bin/xpanel-desktop"

  install -d "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/xpanel-desktop.desktop" "$pkgdir/usr/share/applications/xpanel-desktop.desktop"

  install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -m644 "$srcdir/xpanel-desktop.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/xpanel-desktop.png"
}
