# Maintainer:geekmar <xzh2002436@gmail.com>
pkgname=panda-statusbar-git
pkgver=1.1
_commit=d3a3e546d0adc3b743c0c4bd74d18f5ecdf5c5ee
pkgrel=1
pkgdesc="statusbar for PandaOS"
arch=(x86_64)
url="https://github.com/pandaos/panda-statusbar"
license=('GPL3')
depends=('kwindowsystem' 'qt5-x11extras' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-base' 'libxcomposite' 'libxcb' 'libxrender' 'kdbusaddons' 'libdbusmenu-qt5' 'libxdamage' 'libxtst' 'solid')
source=("$pkgname-$_commit.tar.gz::https://github.com/pandaos/panda-statusbar/archive/$_commit.tar.gz")
sha512sums=('35c6e97a618834c99e6297be8db57a277355e3d8d5a86dd92eed5c5991009885544ab4f9408029bd36d5ab0fd686104229b88107d02fcc03f50e1980f74826ba')


build() {
  cd panda-statusbar-$_commit
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd panda-statusbar-$_commit
  make DESTDIR="$pkgdir" install
}
