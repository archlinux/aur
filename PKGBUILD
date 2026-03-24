pkgname=keyviz-wayland-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Key visualization tool for Wayland (Tauri) - prebuilt binary"
arch=('x86_64')
url="https://github.com/notlimdev/keyviz-wayland"
license=('MIT')
depends=(
  webkit2gtk-4.1
  gtk3
  libayatana-appindicator
  librsvg
)
provides=('keyviz-wayland')
conflicts=('keyviz-wayland')
source=(
  "keyviz-wayland-tauri::https://github.com/notlimdev/keyviz-wayland/releases/download/v$pkgver/keyviz-wayland-tauri"
  "keyviz-wayland.desktop::https://raw.githubusercontent.com/notlimdev/keyviz-wayland/v$pkgver/keyviz-wayland.desktop"
  "keyviz-wayland.png::https://raw.githubusercontent.com/notlimdev/keyviz-wayland/v$pkgver/keyviz-wayland.png"
)
sha256sums=(
  '636e3ae5e6f45da5a786d71fef3d6d72aef9f94c471b18baa0d19297c46fae08'
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "$srcdir/keyviz-wayland-tauri" "$pkgdir/usr/bin/keyviz-wayland"
  install -Dm644 "$srcdir/keyviz-wayland.desktop" \
    "$pkgdir/usr/share/applications/keyviz-wayland.desktop"
  install -Dm644 "$srcdir/keyviz-wayland.png" \
    "$pkgdir/usr/share/pixmaps/keyviz-wayland.png"
}
