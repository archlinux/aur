# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-screenshot-git
_pkgname=cutefish-screenshot
pkgver=0.8.r22.g6976e16
pkgrel=1
pkgdesc="Screenshot tool for CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/screenshot"
license=('GPL')
groups=('cutefish-git')
depends=('fishui-git' 'libcutefish-git' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'qt5-base' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd screenshot
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd screenshot
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd screenshot
  make DESTDIR="$pkgdir" install
}
