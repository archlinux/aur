# Contributor: Andrew Panchenko <panchenkoac at gmail>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=qmmp-plugin-pack
pkgver=1.1.3
pkgrel=1
pkgdesc="Qmmp Plugin Pack"
arch=('i686' 'x86_64')
url="http://qmmp.ylsoftware.com"
license=('GPL')
depends=("qmmp>=$pkgver" 'taglib>=1.7.0' 'mpg123>=1.13.0' 'libxmp>=4.2.0')
makedepends=('cmake>=2.8.6' 'yasm' 'qt5-tools')
source=(http://qmmp.ylsoftware.com/files/plugins/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('80afcc55591c1e16d33952c575f736934a31bd43')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DLIB_DIR=/usr/lib -DCMAKE_BUILD_TYPE=RELEASE -DUSE_FFAP:BOOL=TRUE
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
