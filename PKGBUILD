# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>

pkgname=plasma5-applets-window-appmenu
pkgver=0.1
pkgrel=1
pkgdesc="Plasma 5 applet in order to show the window appmenu"
arch=(x86_64)
url="https://github.com/psifidotos/applet-window-appmenu"
license=(GPL)
depends=(plasma-workspace)
makedepends=(extra-cmake-modules)
source=($pkgname-$pkgver.tar.gz::"https://github.com/psifidotos/applet-window-appmenu/archive/v$pkgver.tar.gz")
sha256sums=('ed7f3aed07da1dca929d18b06cda64eb220de7e98b11b58d303cfb944ef410f7')

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

