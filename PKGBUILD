# Contributor: David Vachulka <arch_dvx@users.sourceforge.net>

pkgname=dxde
pkgver=1.40.0
pkgrel=1
pkgdesc="Program pro vedeni danove evidence (for czech tax records)"
arch=('i686' 'x86_64')
url="http://dxde.dxsolutions.org"
license=('GPL')
depends=('wxgtk2' 'openssl' 'fontconfig' 'curl')
makedepends=('cmake')
install=${pkgname}.install
source=(http://files.dxsolutions.org/$pkgname-$pkgver.tar.gz)
md5sums=('a202b68259d973234939168296e1e285')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
