# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=kcm-fcitx
pkgver=0.4.2
pkgrel=2
pkgdesc="KDE Config Module for Fcitx"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/kcm-fcitx"
license=('GPL')
depends=('fcitx>=4.2.7' 'kdebase-runtime' 'fcitx-qt4')
makedepends=('cmake' 'automoc4')
source=("http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  mkdir -p build
  cd build
    
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DQT_QMAKE_EXECUTABLE=qmake-qt4 ..
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
md5sums=('3c45e7109bec4b6fa984f952fb94002d')
