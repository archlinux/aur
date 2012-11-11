# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=kcm-fcitx
pkgver=0.4.1
pkgrel=1
pkgdesc="KDE Config Module for Fcitx"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/kcm-fcitx"
license=('GPL')
depends=('fcitx>=4.2.6' 'kdebase-runtime')
makedepends=('cmake' 'intltool' 'automoc4')
source=(http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz)
md5sums=('1a2a9802edf6df79d3883c362ba487f0')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}

  rm -rf build
  mkdir build
  cd build
    
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
