# Contributor: David Vachulka <arch_dvx@users.sourceforge.net>

pkgname=dxde
pkgver=1.00.0
pkgrel=1
pkgdesc="Program pro vedeni danove evidence (for czech tax records)"
arch=('i686' 'x86_64')
url="http://dxde.dxsolutions.org"
license=('GPL')
depends=('wxgtk>=3.0.0')
makedepends=('cmake')
install=${pkgname}.install
source=(http://files.dxsolutions.org/$pkgname-$pkgver.tar.gz)
md5sums=('77bfb3faecfe8b4aa66ae2d09d9a0088')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
