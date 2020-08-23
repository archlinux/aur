# Maintainer:geekmar <xzh2002436@gmail.com>

pkgname=panda-dock-git
pkgver=1.0
_commit=ef4472b76c9ab4ef03a40d6e0372be471b749354
pkgrel=1
pkgdesc="Dock for PandaOS"
arch=(x86_64)
url="https://github.com/pandaos/panda-dock"
license=('GPL3')
depends=('kwindowsystem' 'qt5-x11extras' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("$pkgname-$_commit.tar.gz::https://github.com/pandaos/panda-dock/archive/$_commit.tar.gz")
sha512sums=('08b4486afdb7b3cf4f44cfb11a96a478a4f9c35e63bf5479f4cebdc030c6640d26720b54276f1ef0775ec5c86ca3fbb9a5dd59008d0f22a5f862ba0305cc204f')

build() {
  cd panda-dock-$_commit
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd panda-dock-$_commit
  make DESTDIR="$pkgdir" install
}
