# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-filemanager-git
_pkgname=cutefish-filemanager
pkgver=0.8.r0.g4a7c5c3
pkgrel=1
pkgdesc="Cutefish File Manager, simple to use, beautiful, and retain the classic PC interactive design"
arch=('x86_64')
url="https://github.com/cutefishos/filemanager"
license=('GPL')
groups=('cutefish-git')
depends=('fishui-git' 'kio' 'libcutefish-git' 'solid')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd filemanager
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd filemanager

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd filemanager
  make DESTDIR="$pkgdir" install
}
