# Maintainer: Vincent Jousse <vincent@jousse.org> - https://vincent.jousse.org
pkgname=concentre-bin
pkgver=0.10.0
pkgrel=2
pkgdesc="Focus timer with a visual countdown and tray icon (formerly Pomodorolm)"
arch=('x86_64')
url="https://github.com/vjousse/concentre"
license=('AGPL-3.0-only')
depends=('alsa-lib' 'gtk3' 'hicolor-icon-theme' 'glibc' 'webkit2gtk-4.1' 'libsoup' 'cairo' 'glib2' 'pango' 'gcc-libs' 'gdk-pixbuf2' 'libayatana-appindicator')
# The package still installs the `pomodorolm` binary (Tauri productName)
provides=('concentre' 'pomodorolm')
conflicts=('pomodorolm' 'pomodorolm-bin')
replaces=('pomodorolm-bin')
source=("https://github.com/vjousse/concentre/releases/download/app-v$pkgver/pomodorolm_${pkgver}_amd64.deb")
sha256sums=('9e41e9b27b90656a58b22e1d3ae3e31b056fa43a54f9c93b9314c7aa05219917')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"

  # The binary is still named `pomodorolm`
  # also make it available as `concentre`
  ln -s pomodorolm "$pkgdir/usr/bin/concentre"
}
