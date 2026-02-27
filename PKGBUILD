# Maintainer: Alonso Herreros <alonso.herreros at gmail.com

pkgname="hyprcap"
pkgver=1.5.1
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
sha256sums=('3b03054c68d537661fc01adfe05db4e996b390cf2fc8690f11e58fa48657e9bb')

package() {
  cd "$srcdir/$_pkgsrc"

  export DESTDIR="$pkgdir"
  export PKGBASE="$pkgname"
  export PREFIX="/usr"
  export HYPRCAP_VERSION="$pkgver"

  make
  make install
}
