# Contributor: David Vachulka <archdvx@dxsolutions.org>

pkgname=dxtime
pkgver=1.2.4
pkgrel=1
pkgdesc="Program for time tracking"
arch=('i686' 'x86_64')
url="https://dxtime.dxsolutions.org"
license=('GPL')
depends=('wxgtk3')
makedepends=('cmake')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('185d2a66bb50adc1d3b5c92e5ae423af')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DDX_WX_CONFIG=wx-config-gtk3
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
