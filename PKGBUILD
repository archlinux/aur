# Maintainer: Aditya Singh <https://github.com/s-adi-dev>
pkgname=nmgui-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="GTK4-based GUI for NetworkManager (nmcli) — binary release"
arch=('x86_64')
url="https://github.com/s-adi-dev/nmgui"
license=('GPL3')
depends=('networkmanager' 'gtk4' 'python-gobject')
provides=('nmgui')
conflicts=('nmgui')
options=('!strip')

source=(
  "nmgui-$pkgver.bin::https://github.com/s-adi-dev/nmgui/releases/download/v$pkgver/main.bin"
  "nmgui.desktop::https://raw.githubusercontent.com/s-adi-dev/nmgui/main/nmgui.desktop"
)

sha256sums=(
  'b1cdebfbdb2eb42000ead3757cc4c0ac17763d8ebda041a359521fdff3b2b089'
  'SKIP' # You can replace SKIP with actual sha256 via `updpkgsums`
)

noextract=("nmgui-$pkgver.bin")

package() {
  # Install binary
  install -Dm755 "$srcdir/nmgui-$pkgver.bin" "$pkgdir/usr/bin/nmgui"

  # Install desktop entry
  install -Dm644 "$srcdir/nmgui.desktop" "$pkgdir/usr/share/applications/nmgui.desktop"
}
