# Maintainer: tibequadorian <tbqdrn at posteo dot de>

pkgname=dvd_info
pkgver=1.17
pkgrel=1
pkgdesc='DVD utilities to print information, copy tracks, etc.'
url='https://github.com/beandog/dvd_info'
license=('GPL2')
arch=('x86_64')
depends=('libdvdread' 'libdvdcss' 'mpv')
source=("$pkgname-$pkgver.tar.gz::https://github.com/beandog/dvd_info/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0c07060753c80e63b6ac854f2a722ce634fb6d744cfe3514ebfb060a1719fd78')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --with-libmpv
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
