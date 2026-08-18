# Maintainer: Gui <leonsombrio244@gmail.com>
pkgname=wallmgr
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern wallpaper manager written in C++ and QML with smooth animations"
arch=('x86_64')
url="https://github.com/simeulinuxkaliaiwr/wallmgr"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-shadertools' 'libx11')
makedepends=('cmake' 'git')
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
