# Maintainer: Alonso Herreros <alonso.herreros at gmail.com

pkgname="hyprcap"
pkgver=1.2.1
pkgrel=3
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
optdepends=(
  'fuzzel'
)

_pkgsrc="$pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext::$url/archive/v$pkgver.$_pkgext")
sha256sums=('0aed62024d3155b4fba95e784c1412e67c99ad565739b4203bab57a736ce861a')

package() {
  cd "$srcdir/$_pkgsrc"
  mkdir -p "$pkgdir/usr/bin"

  install -Dm755 "hyprcap" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
