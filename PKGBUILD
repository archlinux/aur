# Maintainer: Alonso Herreros <alonso.herreros at gmail.com

pkgname="hyprcap"
pkgver=1.6.2
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
sha256sums=('6c032301d29d7c3187baeb1e91b9f687d624a28e615874c810c0bf040faf1b9d')

package() {
  cd "$srcdir/$_pkgsrc"

  export DESTDIR="$pkgdir"
  export PKGBASE="$pkgname"
  export PREFIX="/usr"
  export HYPRCAP_VERSION="$pkgver"

  make
  make install
}
