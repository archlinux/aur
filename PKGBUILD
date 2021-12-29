# Maintainer: Hakan Erduman <hakan at erduman dot de>
pkgname=xfce4-hamster-plugin
pkgver=1.15
pkgrel=2
pkgdesc="A recreation of the gnome-shell hamster extension as a xfce4 panel plugin."
url="https://github.com/projecthamster/${pkgname}"
arch=('x86_64' 'i686')
license=('GPL')
depends=('xfce4-panel')
#optdepends=('hamster-time-tracker')
makedepends=('pkgconfig' 'intltool' 'cmake' 'hamster-time-tracker')
source=("https://github.com/projecthamster/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ea0894bd5531e71bcf1c385505290ef8c0a8b070edbdc6d4e1e992598570e1d6')

build() {
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -S $pkgname-$pkgver \
    .
  make
}

package() {
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
