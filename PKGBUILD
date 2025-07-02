# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=gsettings-qt6
pkgver=1.0.0
pkgrel=1
pkgdesc="Qml bindings for GSettings"
arch=('x86_64')
url="https://gitlab.com/ubports/development/core/gsettings-qt"
license=('LGPL')
depends=('qt6-declarative')
makedepends=('cmake' 'ninja' 'qt6-tools' 'cmake-extras')
source=("https://gitlab.com/ubports/development/core/gsettings-qt/-/archive/v$pkgver/gsettings-qt-v$pkgver.tar.bz2")
sha256sums=('8471bc586727ab6b47ce0b04563d834608489765f1a2a833fdcc5e04f9dfb070')

build() {
  cd gsettings-qt-v$pkgver
  cmake -S . -B build -GNinja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DENABLE_QT6=ON \
      -DENABLE_WERROR=OFF
  cmake --build build
}

package() {
  cd gsettings-qt-v$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}

