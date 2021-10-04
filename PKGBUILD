# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-statusbar-git
_pkgname=cutefish-statusbar
pkgver=0.4.r26.g8332203
pkgrel=1
pkgdesc="Top status bar of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/statusbar"
license=('GPL')
groups=('cutefish-git')
depends=('fishui-git' 'libcutefish-git' 'libdbusmenu-qt5' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd statusbar
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd statusbar

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd statusbar
  make DESTDIR="$pkgdir" install
}
