# Maintainer: tibequadorian <tbqdrn at posteo dot de>

pkgname=dvd_info
pkgver=2.2
pkgrel=1
pkgdesc='DVD utilities to print information, copy tracks, etc.'
url='https://github.com/beandog/dvd_info'
license=('GPL2')
arch=('x86_64')
depends=('libdvdread' 'libdvdcss' 'mpv')
makedepends=('cmake' 'pkgconf')
optdepends=('ffmpeg: required by the dvd_rip script for transcoding')
source=("$pkgname-$pkgver.tar.gz::https://github.com/beandog/dvd_info/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('de47b6f6443a5ffbcd10ccc2598b28c61b2f74f5dcfc5abd04673b196bb73521')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake . \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
