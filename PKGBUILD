# Maintainer: Alonso Herreros <alonso.herreros at gmail.com

pkgname="hyprcap"
pkgver=1.7.0
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
sha256sums=('4717178998a50d27cc6439d4276ffb271870b015280fe159bf9f2f279510adec')

package() {
  cd "$srcdir/$_pkgsrc"

  export DESTDIR="$pkgdir"
  export PKGBASE="$pkgname"
  export PREFIX="/usr"
  export HYPRCAP_VERSION="$pkgver"

  make
  make install
}
