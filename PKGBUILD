# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>

pkgname=plasma5-applets-window-appmenu
pkgver=0.4.1
pkgrel=1
pkgdesc="Plasma 5 applet in order to show the window appmenu"
arch=(x86_64)
url="https://github.com/psifidotos/applet-window-appmenu"
license=(GPL)
depends=(plasma-workspace libxcb)
makedepends=(extra-cmake-modules)
source=($pkgname-$pkgver.tar.gz::"https://github.com/psifidotos/applet-window-appmenu/archive/v$pkgver.tar.gz")
sha256sums=('5e7deada287ee9a1296663d9d18aaa67690c5fcdb2d202dfe534fe244b5a32b8')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../applet-window-appmenu-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

