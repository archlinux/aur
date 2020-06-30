# Maintainer: Reven Martin <revenmartin@gmail.com>

pkgname=panda-topbar
pkgver=0.1
_commit=d41e96e2fd9d72b60847cc702aa83fb2bfb7f5c3
pkgrel=1
pkgdesc="topbar for PandaDE"
arch=(x86_64)
url="https://github.com/pandaos/panda-topbar"
license=('GPL3')
depends=('kwindowsystem' 'qt5-x11extras' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-base' 'libxcomposite' 'libxcb' 'libxrender' 'kdbusaddons' 'libdbusmenu-qt5' 'libxdamage' 'libxtst')
source=("$pkgname-$_commit.tar.gz::https://github.com/pandaos/panda-topbar/archive/$_commit.tar.gz")
sha512sums=('6a4174c2bd2e0eb5d8a48742bbc24dcaf13cc0f4593c2a55a83ea6f89d0048e2f7bef106a809f710e232c8899a99c03ed7503afd9279aeb3e00d776e42d04ac7')

build() {
  cd panda-topbar-$_commit
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd panda-topbar-$_commit
  make DESTDIR="$pkgdir" install
}
