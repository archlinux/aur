# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=language-bar-bin
_pkgname=language-bar
pkgver=0.2.0
pkgrel=1
pkgdesc="Keyboard layout flag tray for niri, Sway, and X11"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/language-bar"
license=('Unlicense')
depends=('glibc' 'gcc-libs' 'libxkbcommon' 'xkeyboard-config' 'dbus')
optdepends=(
  'zenity: shortcut configuration dialogs'
  'waybar: StatusNotifier tray host'
  'niri: niri Wayland backend'
  'sway: Sway Wayland backend'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!strip)

source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('13456c3ddbb7ef1aa4d5cd577aa4c697394947cb3ac6ea4e6ec7856e3a929d70')
sha256sums_aarch64=('e7b508406d00aedb46011a047f569c6e28112cfa230e5203deb4589c4ab202f7')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  if [[ -f "$srcdir/LICENSE" ]]; then
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
