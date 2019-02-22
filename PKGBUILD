# Contributor: Andrew Panchenko <panchenkoac at gmail>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=qmmp-plugin-pack
pkgver=1.3.0
pkgrel=2
pkgdesc="Qmmp Plugin Pack"
arch=('i686' 'x86_64')
url="http://qmmp.ylsoftware.com"
license=('GPL')
depends=("qmmp>=$pkgver" 'taglib>=1.7.0' 'mpg123>=1.13.0' 'libxmp>=4.2.0')
makedepends=('cmake>=2.8.6' 'yasm' 'qt5-tools')
source=(http://qmmp.ylsoftware.com/files/plugins/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('e844fe7cdc041728244c0a207159291b1f4c0a16')

build() {
    mkdir _build
    cd _build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_BUILD_TYPE=RELEASE -DUSE_FFAP:BOOL=TRUE "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
	cd _build
	make DESTDIR="${pkgdir}" install
}
