# Maintainer: Benedict Etzel <gitter@liftm.de.de>

pkgname=mrtdreader
pkgver=0.1.6
pkgrel=1
pkgdesc='Machine readable travel documents reader'
arch=('x86_64')
url='https://github.com/rubund/mrtdreader'
license=('gpl')
depends=('libnfc')
makedepends=('cmake')
source=("https://github.com/rubund/mrtdreader/archive/0.1.6.tar.gz")
sha256sums=('1aee5c4cf40e6780e555aa507690c99db2216c647ec07d4de0909f2293489908')


build() {
	cd ${pkgname}-${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	cmake --build .
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
}

