# Contributor: David Vachulka <arch_dvx@users.sourceforge.net>

pkgname=dxde
pkgver=1.40.2
pkgrel=1
pkgdesc="Program pro vedeni danove evidence (for czech tax records)"
arch=('i686' 'x86_64')
url="http://dxde.dxsolutions.org"
license=('GPL')
depends=('wxgtk2' 'openssl' 'fontconfig' 'curl')
makedepends=('cmake')
install=${pkgname}.install
source=(http://files.dxsolutions.org/$pkgname-$pkgver.tar.gz)
md5sums=('15ba9bf9dd7180123588a94b5a517342')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
