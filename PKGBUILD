# Contributor: David Vachulka <arch_dvx@users.sourceforge.net>

pkgname=dxtime
pkgver=1.2.0
pkgrel=1
pkgdesc="Program for time tracking"
arch=('i686' 'x86_64')
url="http://dxtime.dxsolutions.org"
license=('GPL')
depends=('wxgtk>=3.0.0')
makedepends=('cmake')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4612c5e17c8864eacf55de2a89c1f952')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
