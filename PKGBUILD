# Contributor: David Vachulka <archdvx@dxsolutions.org>

pkgname=xfce4-dxreminders-plugin
pkgver=1.0.0
pkgrel=1
pkgdesc="Reminders, date and time plugin for the Xfce4 panel"
arch=('i686' 'x86_64')
url="https://dxreminders.dxsolutions.org/plugin/"
license=('GPL2')
depends=('xfce4-panel' 'dxreminders>=1.20.0')
makedepends=('cmake')
install=${pkgname}.install
source=(https://files.dxsolutions.org/$pkgname-$pkgver.tar.gz)
md5sums=('269348e663d93b78275467ed0cf0b376')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
