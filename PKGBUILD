# Maintainer: Nicholas Heyer <nick@heyer.app>
pkgname=deadlywp-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="Live wallpapers: videos, GIFs, pictures, web pages, Lively and Wallpaper Engine wallpapers"
arch=('x86_64')
url="https://github.com/nickheyer/deadlywallpaper"
license=('MIT')
depends=('glibc' 'gcc-libs' 'glib2' 'cairo' 'gdk-pixbuf2' 'gtk3' 'libsoup3' 'webkit2gtk-4.1' 'libpulse' 'libglvnd' 'mpv')
optdepends=('libappindicator: tray icon'
            'libayatana-appindicator: tray icon'
            'steam: Steam Workshop downloads'
            'plasma-workspace: KDE Plasma wallpaper plugin')
provides=('deadlywp')
conflicts=('deadlywp')
source=("deadlywp-${pkgver}-x86_64-linux.tar.gz::https://github.com/nickheyer/deadlywallpaper/releases/download/v${pkgver}/deadlywp-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('260267de1985dcd3e3e706da2f4a862dbee18b3684b5bbd6b1cabee254789033')

package() {
  install -Dm755 "${srcdir}/deadlywp" "${pkgdir}/usr/bin/deadlywp"
  install -Dm644 "${srcdir}/deadlywp.desktop" "${pkgdir}/usr/share/applications/deadlywp.desktop"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/deadlywp.png"
  install -Dm644 "${srcdir}/icon-32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/deadlywp.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
