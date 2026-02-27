pkgname=arch-soundpad
pkgver=0.2.0
pkgrel=1
pkgdesc="Soundpad-style app for Arch Linux with virtual mic routing"
arch=('any')
url="https://github.com/JameelSawafta/arch-soundpad"
license=('MIT')
depends=('python' 'tk' 'ffmpeg' 'pipewire-pulse' 'python-xlib')
makedepends=()
source=("arch-soundpad-${pkgver}.tar.gz::https://github.com/JameelSawafta/arch-soundpad/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f23372073b741b4d3ffa6262028701dfac5a62d1a93af91de03a8e820755ef20')
install='arch-soundpad.install'

package() {
  install -Dm755 "$srcdir/arch-soundpad-${pkgver}/soundpad_app.py" "$pkgdir/usr/share/arch-soundpad/soundpad_app.py"
  install -Dm755 "$srcdir/arch-soundpad-${pkgver}/arch-soundpad" "$pkgdir/usr/bin/arch-soundpad"
  install -Dm644 "$srcdir/arch-soundpad-${pkgver}/arch-soundpad.desktop" "$pkgdir/usr/share/applications/arch-soundpad.desktop"
  install -Dm644 "$srcdir/arch-soundpad-${pkgver}/arch-soundpad.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/arch-soundpad.svg"
  install -Dm644 "$srcdir/arch-soundpad-${pkgver}/README.md" "$pkgdir/usr/share/doc/arch-soundpad/README.md"
}
