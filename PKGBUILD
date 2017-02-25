# Maintainer: pingplug <pingplug@foxmail.com>

pkgname=openslide
pkgver=3.4.1
pkgrel=1
pkgdesc='library that provides a simple interface to read whole-slide images'
arch=('i686' 'x86_64')
url='http://openslide.org/'
license=('LGPL')
depends=('glibc')
source=("https://github.com/openslide/openslide/releases/download/v3.4.1/openslide-3.4.1.tar.xz")
sha256sums=('9938034dba7f48fadc90a2cdf8cfe94c5613b04098d1348a5ff19da95b990564')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
