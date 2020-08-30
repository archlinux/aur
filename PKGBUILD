# Maintainer:geekmar(xzh2002436@gmail.com)
pkgname=panda-files-git
pkgver=0.0.0.WTF
_commit=e53c9791b40d31fd339d4220cccd7283e3e3f8e6
pkgrel=1
pkgdesc="file manager for PandaOS"
arch=(x86_64)
url="https://github.com/pandaos/panda-files"
license=('GPL3')
depends=('kwindowsystem' 'qt5-x11extras' 'qt5-svg' 'libexif' 'menu-cache' 'qt5-base')
makedepends=('cmake' 'qt5-tools')
source=("$pkgname-$_commit.tar.gz::https://github.com/pandaos/panda-files/archive/$_commit.tar.gz")
sha512sums=('004e6485535e7f69a4d8d6010e347d78fdd66c1803d35bba93a5ccb63a68b2f03d9b2003e8c494e4a5471dc031e866b9ef989eb82b7bf37bd2871cfa800e9046')

build() {
  cd panda-files-$_commit
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd panda-files-$_commit
  make DESTDIR="$pkgdir" install
}
