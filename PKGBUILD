# Maintainer:geekmar(xzh2002436@gmail.com)
pkgname=panda-files-git
pkgver=1.1
_commit=b3b039fa20efb59a19c4508dfe4eeca4ec488796
pkgrel=1
pkgdesc="file manager for PandaOS"
arch=(x86_64)
url="https://github.com/pandaos/panda-files"
license=('GPL3')
depends=('kwindowsystem' 'qt5-x11extras' 'qt5-svg' 'libexif' 'menu-cache' 'qt5-base')
makedepends=('cmake' 'qt5-tools')
source=("$pkgname-$_commit.tar.gz::https://github.com/pandaos/panda-files/archive/$_commit.tar.gz")
sha512sums=('afaa0eeaaf6033d8c77c84160d71c9325de5d90db8476d4db68a7eee1ab5dd487ea617d21406ddb1376886eee0f48f8b55adadd4ec97a0af267edb8c3bf9fa3b')

build() {
  cd panda-files-$_commit
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd panda-files-$_commit
  make DESTDIR="$pkgdir" install
}
