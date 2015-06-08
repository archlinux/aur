# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kdeplasma-applets-miniplayer
pkgver=2.5
pkgrel=1
pkgdesc="A plasmoid for playing multimedia."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Mini+Player?content=95501"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
source=("http://www.kde-look.org/CONTENT/content-files/95501-miniplayer-${pkgver}.tar.bz2")
sha1sums=('f4bdb3ae725214d248b6965ecb8f1cb2bbd2bd00')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../miniplayer-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
