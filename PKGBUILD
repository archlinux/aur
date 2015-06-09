# Contributor: David Vachulka <arch_dvx@users.sourceforge.net>

pkgname=dxreminders
pkgver=1.10.1
pkgrel=1
pkgdesc="A simple program for reminders"
arch=('i686' 'x86_64')
url="http://dxreminders.dxsolutions.org"
license=('GPL')
depends=('wxgtk>=3.0.0')
makedepends=('cmake')
install=${pkgname}.install
source=(http://files.dxsolutions.org/$pkgname-$pkgver.tar.gz)
md5sums=('ccf770278ec8c580f8ca16c1b7ce6ad0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
