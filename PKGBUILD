# Maintainer: Alonso Herreros <alonso.herreros at gmail.com

pkgname="hyprcap"
pkgver=1.6.1
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
optdepends=(
  'fuzzel'
)

_pkgsrc="$pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext::$url/archive/v$pkgver.$_pkgext")
sha256sums=('d0870a3e90fa86b4826078410c82519b7009c113daf760ec8a187bd5c1f1c741')

package() {
  cd "$srcdir/$_pkgsrc"

  export DESTDIR="$pkgdir"
  export PKGBASE="$pkgname"
  export PREFIX="/usr"
  export HYPRCAP_VERSION="$pkgver"

  make
  make install
}
