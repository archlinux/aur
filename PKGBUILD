# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

pkgname=isight-firmware-tools
pkgver=1.6
pkgrel=2
pkgdesc="Tools to manipulate firmware for Built-in iSight found on Apple machines"
arch=('i686' 'x86_64')
url="https://launchpad.net/isight-firmware-tools/"
license=('GPL2')
source=(http://launchpad.net/isight-firmware-tools/main/1.6/+download/isight-firmware-tools-$pkgver.tar.gz)
sha256sums=('3181973db8a1cadd68785cd81959c8e1e9dc8110342ec1639a50db53d82a367e')
depends=('libusb-compat')
makedepends=('intltool' 'gcc')
install=isight-firmware-tools.install

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install || return 1
}
