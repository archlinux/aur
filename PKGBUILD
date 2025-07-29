# Maintainer: Alonso Herreros <alonso.herreros at gmail.com

pkgname="hyprcap"
pkgver=1.2.0
pkgrel=1
url="https://github.com/alonso-herreros/hyprcap"
pkgdesc="A utility to easily capture screenshots and recordings in Hyprland"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'hyprland'
  'bash'
  'grim'
  'wf-recorder'
  'jq'
  'libnotify'
  'slurp'
  'hyprpicker' # To freeze the screen
  'wl-clipboard'
)

_pkgsrc="$pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext::$url/archive/v$pkgver.$_pkgext")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

package() {
  cd "$srcdir/$_pkgsrc"
  mkdir -p "$pkgdir/usr/bin"

  install -Dm755 "hyprcap" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
