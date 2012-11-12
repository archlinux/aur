# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-anthy
pkgver=0.1.1
pkgrel=1
pkgdesc="Fcitx Wrapper for anthy."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx>=4.2.5' 'anthy')
makedepends=('cmake' 'intltool')
source=("http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz")
install='fcitx-anthy.install'

build(){
  cd "$srcdir"/${pkgname}-${pkgver}

  rm -rf build
  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
}
md5sums=('651e9a21e5203c14ca0968c63a820157')
