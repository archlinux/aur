#Maintainer: Mark Riedesel <mark@klowner.com>

pkgname=easy_profiler
pkgver=1.3.0
pkgrel=0
pkgdesc='Lightweight cross-platform profiler library for c++'
arch=('x86_64' 'i686' 'arm')
url='https://github.com/yse/easy_profiler'
license=('MIT')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yse/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_PREFIX=/usr

	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/build
	make DESTDIR=${pkgdir} install
	mv ${pkgdir}/usr/bin/*.so ${pkgdir}/usr/lib/
}

md5sums=('07b0c1a666c905c2894dbd323ed6efe7')
