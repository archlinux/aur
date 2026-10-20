# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=language-bar-bin
_pkgname=language-bar
pkgver=0.2.1
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

sha256sums_x86_64=('e5a4f8415d09d2f03296476acdf67d0de42457246be6fdd536cf4be964b232aa')
sha256sums_aarch64=('1efabf605a4323fb5a2db86a71170531e49865f9e6474ae80b69a5070cad624d')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  if [[ -f "$srcdir/LICENSE" ]]; then
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
