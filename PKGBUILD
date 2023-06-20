# Maintainer:
# Contributor: Aitor Alonso <contact: https://aalonso.eu>

_pkgname="qogir-icon-theme"
pkgname="$_pkgname-git"
pkgver=2023.06.05.r5.g7edbf61f
pkgrel=1
pkgdesc='A colorful design icon theme for linux desktops'
arch=('any')
url='https://github.com/vinceliuice/Qogir-icon-theme'
license=('GPL3')

depends=()
makedepends=(
  'git'
  'gtk-update-icon-cache'
)

provides=("$_pkgname")
conflicts=(${provides[@]})

options=(!strip !debug)

source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/share/icons"
  ./install.sh -d "$pkgdir/usr/share/icons"
}
