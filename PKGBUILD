# Maintainer:
# Contributor: Yukina <yukihana3230 at gmail dot com>

_pkgname="qogir-cursor-theme"
pkgname="$_pkgname-git"
pkgver=2023.06.05.r16.g4f199dbc
pkgrel=1
pkgdesc='This is an x-cursor theme inspired by Qogir theme'
arch=('any')
url='https://github.com/vinceliuice/Qogir-icon-theme.git'
license=('GPL3')

depends=()
makedepends=('git')

provides=("$_pkgname")
conflicts=(${provides[@]})

options=(!strip !debug)

source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname/src/cursors/"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname/src/cursors/"
  sudo ./install.sh
}
