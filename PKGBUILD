# Contributor: David Vachulka <archdvx@dxsolutions.org>

pkgname=dxde
pkgver=1.40.7
pkgrel=1
pkgdesc="Program pro vedeni danove evidence (for czech tax records)"
arch=('i686' 'x86_64')
url="https://dxde.dxsolutions.org"
license=('GPL')
depends=('wxgtk3' 'openssl' 'fontconfig' 'curl')
makedepends=('cmake')
install=${pkgname}.install
source=(https://files.dxsolutions.org/$pkgname-$pkgver.tar.gz)
md5sums=('2382d62b7b5504422f40e92cbc1bd001')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DDX_WX_CONFIG=wx-config-gtk3
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
