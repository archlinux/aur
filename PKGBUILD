# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>

pkgname=plasma5-applets-window-appmenu
pkgver=0.5.0
pkgrel=1
pkgdesc="Plasma 5 applet in order to show the window appmenu"
arch=(x86_64)
url="https://github.com/psifidotos/applet-window-appmenu"
license=(GPL)
depends=(plasma-workspace libxcb)
makedepends=(extra-cmake-modules)
source=($pkgname-$pkgver.tar.gz::"https://github.com/psifidotos/applet-window-appmenu/archive/v$pkgver.tar.gz")
sha256sums=('4af9f4e7ba32edf4d405a9890e42fe7039281cc4a7bc124d05cb4ab47ef4bcee')

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

