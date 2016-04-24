# Contributor: David Vachulka <arch_dvx@users.sourceforge.net>

pkgname=dxde
pkgver=1.20.0
pkgrel=1
pkgdesc="Program pro vedeni danove evidence"
arch=('i686' 'x86_64')
url="http://dxde.dxsolutions.org"
license=('GPL')
depends=('wxgtk>=3.0.0' 'openssl' 'fontconfig')
makedepends=('cmake')
install=${pkgname}.install
source=(http://files.dxsolutions.org/$pkgname-$pkgver.tar.gz)
md5sums=('ef55c657ebbdb6d898f22f60f31d980d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
