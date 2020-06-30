# Maintainer: Reven Martin <revenmartin@gmail.com>

pkgname=panda-dock
pkgver=0.1
_commit=aefae41da9e20e3952f99ca0fc7750486999173f
pkgrel=1
pkgdesc="Dock for PandaDE"
arch=(x86_64)
url="https://github.com/pandaos/panda-dock"
license=('GPL3')
depends=('kwindowsystem' 'qt5-x11extras' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("$pkgname-$_commit.tar.gz::https://github.com/pandaos/panda-dock/archive/$_commit.tar.gz")
sha512sums=('e1c9f80867f587412c094b113069c296a0ae6057679f74aca521086921f342e412996ef140aa4b8c29a4c542cae4501f172e888f755f4918b3a6aa91a76b800f')

build() {
  cd panda-dock-$_commit
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd panda-dock-$_commit
  make DESTDIR="$pkgdir" install
}
