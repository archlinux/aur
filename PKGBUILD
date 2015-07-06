# Contributor: David Vachulka <arch_dvx@users.sourceforge.net>

pkgname=dxfaktura
pkgver=1.00.0
pkgrel=1
pkgdesc="Program pro fakturaci (for czech invocing)"
arch=('i686' 'x86_64')
url="http://dxfaktura.dxsolutions.org"
license=('GPL')
depends=('qt5-base' 'qt5-tools' 'qt5-webkit')
makedepends=('cmake')
install=${pkgname}.install
source=(http://files.dxsolutions.org/$pkgname-$pkgver.tar.gz)
md5sums=('4a9d7264d43080b8c22fa20af3925f02')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
