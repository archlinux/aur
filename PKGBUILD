pkgname=keybox-bin
pkgver=1.2.0
pkgrel=2
pkgdesc="A minimal, encrypted, local password manager."
arch=('x86_64')
url="https://github.com/cruglet/keybox"
license=('MIT')
depends=(vulkan-icd-loader)
source=(
  "keybox-linux.x86_64::https://github.com/cruglet/keybox/releases/download/v1.2.0/keybox-linux.x86_64"
  "keybox.png::https://raw.githubusercontent.com/cruglet/keybox/main/meta/full-logo_256x.png"
)
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/keybox-linux.x86_64" "$pkgdir/usr/bin/keybox"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/keybox.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Keybox
Comment=A minimal, encrypted, local password manager.
Exec=keybox
Icon=keybox
Categories=Utility;Security;
Terminal=false
DESKTOP
  install -Dm644 "$srcdir/keybox.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/keybox.png"
}
