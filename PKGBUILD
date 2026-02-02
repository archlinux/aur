# Maintainer: Cruglet <cruglet@gmail.com>
pkgname=keybox-bin
pkgver=1.0.0_beta_1
pkgrel=1
pkgdesc="A minimal, encrypted, local password manager."
arch=('x86_64')
url="https://github.com/cruglet/keybox"
license=('MIT')
depends=('vulkan-icd-loader')
source=(
  "keybox-linux.x86_64::https://github.com/cruglet/keybox/releases/download/v1.0.0-beta.1/keybox-linux.x86_64"
  "keybox.png::https://raw.githubusercontent.com/cruglet/keybox/main/meta/full-logo_256x.png"
)
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/keybox-linux.x86_64" "$pkgdir/usr/bin/keybox"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/keybox.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Keybox
Comment=A minimal, encrypted, local password manager
Exec=keybox
Icon=keybox
Categories=Utility;Security;
Terminal=false
EOF

    install -Dm644 "$srcdir/keybox.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/keybox.png"
}

