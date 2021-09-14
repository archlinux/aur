# Contributor: David Vachulka <archdvx@dxsolutions.org>

pkgname=wxdfast
pkgver=0.70.2
pkgrel=1
pkgdesc="Multithread download manager"
arch=('i686' 'x86_64')
url="https://wxdfast.dxsolutions.org"
license=('GPL')
depends=('wxgtk3' 'aria2' 'openssl')
makedepends=('cmake')
install=${pkgname}.install
source=(https://github.com/archdvx/wxdfast/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('1c1247b0169f5ed38472ea917286c7e8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DDX_WX_CONFIG=wx-config-gtk3
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
