# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma5-applets-window-buttons
pkgver=0.1
pkgrel=1
pkgdesc="Plasma 5 applet in order to show window buttons in your panels"
arch=(x86_64)
url="https://github.com/psifidotos/applet-window-buttons"
license=(GPL)
depends=(plasma-workspace)
makedepends=(extra-cmake-modules)
source=($pkgname-$pkgver.tar.gz::"https://github.com/psifidotos/applet-window-buttons/archive/v$pkgver.tar.gz")
sha256sums=('08afff3fb59d4966a3b799d70e4eec0a0dc808af9327f936d23a98baa613a667')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../applet-window-buttons-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
