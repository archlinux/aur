# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>

pkgname=plasma5-applets-window-appmenu
pkgver=0.2
pkgrel=1
pkgdesc="Plasma 5 applet in order to show the window appmenu"
arch=(x86_64)
url="https://github.com/psifidotos/applet-window-appmenu"
license=(GPL)
depends=(plasma-workspace)
makedepends=(extra-cmake-modules)
source=($pkgname-$pkgver.tar.gz::"https://github.com/psifidotos/applet-window-appmenu/archive/v$pkgver.tar.gz")
sha256sums=('37e9865f614ec91bd04b26f74e8b84cb53974d714ddbdbe35376762bb6f7f583')

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

