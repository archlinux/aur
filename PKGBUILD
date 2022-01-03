# Maintainer: Hakan Erduman <hakan at erduman dot de>
pkgname=xfce4-hamster-plugin
pkgver=1.17
pkgrel=0
pkgdesc="A recreation of the gnome-shell hamster extension as a xfce4 panel plugin."
url="https://github.com/projecthamster/${pkgname}"
arch=('x86_64' 'i686')
license=('GPL')
depends=('xfce4-panel')
#optdepends=('hamster-time-tracker')
makedepends=('pkgconfig' 'intltool' 'cmake' 'hamster-time-tracker')
source=("https://github.com/projecthamster/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1ceeaadec163ac5c6ee53548cd426283dd66b3c29a656a2361266da6e848e9bb')

build() {
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -S $pkgname-$pkgver \
    .
  cmake --build .
}

package() {
  DESTDIR="$pkgdir/" cmake --install .
}

# vim:set ts=2 sw=2 et:
