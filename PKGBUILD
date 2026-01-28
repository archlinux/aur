# Maintainer: Pater Kleomenis <paterkleomenis@gmail.com>
pkgname=connected-desktop-bin
_pkgname=connected-desktop
pkgver=1.0.9
pkgrel=1
pkgdesc="High-speed, offline, cross-platform ecosystem bridging devices (Binary)"
arch=('x86_64')
url="https://github.com/paterkleomenis/connected"
license=('MIT' 'Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'openssl' 'dbus')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("https://github.com/paterkleomenis/connected/releases/download/v${pkgver}/connected-desktop"
        "https://raw.githubusercontent.com/paterkleomenis/connected/main/packaging/aur/connected-desktop.desktop"
        "https://raw.githubusercontent.com/paterkleomenis/connected/main/android/app/src/main/ic_launcher-playstore.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
  # Install binary
  install -Dm755 "connected-desktop" "$pkgdir/usr/bin/$_pkgname"

  # Install Desktop File
  install -Dm644 "connected-desktop.desktop" "$pkgdir/usr/share/applications/connected-desktop.desktop"

  # Install Icon
  install -Dm644 "ic_launcher-playstore.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/connected-desktop.png"

  # Install licenses
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-APACHE"
}
