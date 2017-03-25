# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=latte-dock
pkgver=0.5.98
pkgrel=1
pkgdesc='A dock based on plasma frameworks'
arch=('i686' 'x86_64')
url='https://github.com/psifidotos/Latte-Dock'
license=('GPL')
depends=('qt5-base' 'qt5-declarative' 'qt5-x11extras' 'kiconthemes' 'kdbusaddons'
         'kxmlgui' 'kdeclarative' 'plasma-framework' 'plasma-desktop')
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/psifidotos/Latte-Dock/archive/$pkgver.tar.gz")
sha256sums=('d4594ac9dd70ad42658670e7d66506b653dddd3d381c5941eb718b786a6e9661')

build() {
  cd Latte-Dock-$pkgver

  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd Latte-Dock-$pkgver/build

  make DESTDIR="$pkgdir" install
}
