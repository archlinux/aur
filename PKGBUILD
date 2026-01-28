# Maintainer: Your Name <your.email@example.com>
pkgname=pwsp-bin
_pkgname=pwsp
pkgver=1.5.0
pkgrel=1
pkgdesc="Lets you play audio files through your microphone (Pre-built binaries)"
arch=('x86_64')
url="https://github.com/arabianq/pipewire-soundpad"
license=('MIT')
depends=('pipewire' 'alsa-lib')
provides=('pwsp')
conflicts=('pwsp')
source=("https://github.com/arabianq/pipewire-soundpad/releases/download/v$pkgver/pwsp-v$pkgver-linux-x64.zip")
sha256sums=('SKIP')

package() {
  cd "$srcdir"

  install -Dm755 "pwsp-cli" "${pkgdir}/usr/bin/pwsp-cli"
  install -Dm755 "pwsp-daemon" "${pkgdir}/usr/bin/pwsp-daemon"
  install -Dm755 "pwsp-gui" "${pkgdir}/usr/bin/pwsp-gui"

  install -Dm644 "assets/pwsp-gui.desktop" "${pkgdir}/usr/share/applications/pwsp-gui.desktop"
  install -Dm644 "assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/icon.png"
  install -Dm644 "assets/pwsp-daemon.service" "${pkgdir}/usr/lib/systemd/user/pwsp-daemon.service"
  
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}