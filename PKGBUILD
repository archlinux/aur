# Maintainer: Shahriyar Alam <mdshahriyaralam552@gmail.com>
# Prebuilt binaries - no Rust toolchain needed to install.
pkgname=maono-bin
_pkgname=maono
pkgver=0.1.0
pkgrel=1
pkgdesc='Control a Maono PD100W wireless microphone - TUI, GUI and CLI (prebuilt)'
arch=('x86_64')
url='https://github.com/shahriyardx/maono'
license=('MIT')
depends=('gcc-libs' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'libglvnd')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip' '!debug')
source=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('b14d102e0c519986ff06faf5746b7bece76a86af19da14ab22a0054fd0e2f5bd')

package() {
  cd "$_pkgname-$pkgver-x86_64"
  install -Dm755 maono "$pkgdir/usr/bin/maono"
  install -Dm755 maono-gui "$pkgdir/usr/bin/maono-gui"
  install -Dm644 99-maono.rules "$pkgdir/usr/lib/udev/rules.d/99-maono.rules"
  install -Dm644 maono-gui.desktop "$pkgdir/usr/share/applications/maono-gui.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
