# Maintainer: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

_srcver='2015.12.26'
pkgname=libz
pkgver=1.2.8
pkgrel=1
pkgdesc='An API- and ABI- compatible replacement drop-in replacement for zlib 1.2.8'
arch=('i686' 'x86_64')
url="http://sortix.org/libz/"
license=('custom')
depends=('glibc')
provides=("zlib")
conflicts=("zlib")
source=("https://sortix.org/libz/release/libz-${pkgver}.${_srcver}.tar.gz")
sha256sums=('abcc2831b7a0e891d0875fa852e9b9510b420d843d3d20aad010f65493fe4f7b')

prepare() {
	cd ${srcdir}/libz-${pkgver}.${_srcver}
}

build() {
	cd ${srcdir}/libz-$pkgver.${_srcver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/libz-$pkgver.${_srcver}

	make install DESTDIR=${pkgdir}
}
