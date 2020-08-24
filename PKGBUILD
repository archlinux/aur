# Maintainer:geekmar <xzh2002436@gmail.com>
pkgname=panda-statusbar-git
pkgver=1.0.
_commit=82709ae970074df15a543a9384b29e238466ddce
pkgrel=1
pkgdesc="statusbar for PandaOS"
arch=(x86_64)
url="https://github.com/pandaos/panda-statusbar"
license=('GPL3')
depends=('kwindowsystem' 'qt5-x11extras' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-base' 'libxcomposite' 'libxcb' 'libxrender' 'kdbusaddons' 'libdbusmenu-qt5' 'libxdamage' 'libxtst')
source=("$pkgname-$_commit.tar.gz::https://github.com/pandaos/panda-statusbar/archive/$_commit.tar.gz")
sha512sums=('6c93e34d37eec3f773abc9aa12d34e793794cb9cc53bd4cc5f2aaaa86b737a483118b09a5ef53c493a21b89fb2f7d7120d72202f421d227cb578737b611ead5e')


build() {
  cd panda-statusbar-$_commit
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd panda-statusbar-$_commit
  make DESTDIR="$pkgdir" install
}
