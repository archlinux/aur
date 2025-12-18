# Maintainer: Alonso Herreros <alonso.herreros at gmail.com

pkgname="hyprcap"
pkgver=1.4.0
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
sha256sums=('f2c6699ce90f40a9dcfbbfb50bedeb0afb2f619e0fee8e60e3873bbfba824258')

package() {
  cd "$srcdir/$_pkgsrc"

  export DESTDIR="$pkgdir"
  export PKGBASE="$pkgname"
  export PREFIX="/usr"

  make
  make install
}
