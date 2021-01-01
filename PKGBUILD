# Contributor: David Vachulka <arch_dvx@users.sourceforge.net>

pkgname=dxtime
pkgver=1.2.2
pkgrel=3
pkgdesc="Program for time tracking"
arch=('i686' 'x86_64')
url="https://dxtime.dxsolutions.org"
license=('GPL')
depends=('wxgtk3')
makedepends=('cmake')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b4d8d6e9935e4c996bd371042fe91838')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DDX_WX_CONFIG=wx-config-gtk3
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
