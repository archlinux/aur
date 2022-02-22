# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-terminal-git
_pkgname=cutefish-terminal
pkgver=0.7.r29.g5c6ec82
pkgrel=1
pkgdesc="A terminal emulator for Cutefish"
arch=('x86_64')
url="https://github.com/cutefishos/terminal"
license=('GPL')
groups=('cutefish-git')
depends=('fishui-git' 'libcutefish-git' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd terminal
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd terminal

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd terminal
  make DESTDIR="$pkgdir" install
}
