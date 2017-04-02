# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=latte-dock
pkgver=0.6.0
pkgrel=1
pkgdesc='A dock based on plasma frameworks'
arch=('i686' 'x86_64')
url='https://github.com/psifidotos/Latte-Dock'
license=('GPL')
depends=('qt5-base' 'qt5-declarative' 'qt5-x11extras' 'kiconthemes' 'kdbusaddons'
         'kxmlgui' 'kdeclarative' 'plasma-framework' 'plasma-desktop')
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/psifidotos/Latte-Dock/archive/v$pkgver.tar.gz")
sha256sums=('ecc573e999e0551e96baaae1ccf5fce7093281f958554e2e42195a1a57dc07af')

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
