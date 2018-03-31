# Maintainer: Julius Michaelis <gitter@liftm.de.de>
# Contributor: Doug Newgard <scimmia@archlinux.org>

pkgname=mrtdreader
pkgver=0.1.6
pkgrel=1
pkgdesc='Machine readable travel documents reader'
arch=('x86_64')
url='https://github.com/rubund/mrtdreader'
license=('GPL3')
depends=('libnfc')
source=("${pkgname}-${pkgver}.tgz::https://github.com/rubund/mrtdreader/archive/${pkgver}.tar.gz")
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

