# Maintainer:
# Contributor: Gustavo Parreira <gustavotcparreira at gmail dot com>

_pkgname="hyprshot"
pkgname="$_pkgname"
pkgver=1.3.0
pkgrel=2
url="https://github.com/Gustash/Hyprshot"
pkgdesc="A utility to easily take screenshots in Hyprland"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'bash'
  'grim'
  'jq'
  'libnotify'
  'slurp'
  'wl-clipboard'
)
optdepends=(
  'hyprpicker: to freeze the screen while taking the screenshot'
)

_pkgsrc="Hyprshot-$pkgver"
_pkgext="tar.gz"
source=("${_pkgsrc,,}.$_pkgext"::"$url/archive/$pkgver.$_pkgext")
sha256sums=('315bdbe66ee473d811b9af8447bd32124e84d873396ef8ab5ac3f040294f6739')

package() {
  install -Dm755 "$_pkgsrc/hyprshot" -t "$pkgdir/usr/bin/"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
