# Contributor: David Vachulka <arch_dvx@users.sourceforge.net>

pkgname=dxtime
pkgver=1.2.2
pkgrel=1
pkgdesc="Program for time tracking"
arch=('i686' 'x86_64')
url="http://dxtime.dxsolutions.org"
license=('GPL')
depends=('wxgtk2')
makedepends=('cmake')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('48828808460fe72eeee16677bc8a5999')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
