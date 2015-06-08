# Maintainer: Connor Behan <connor.behan@gmail.com>
pkgname=libbdplus
pkgver=0.1.2
pkgrel=1
pkgdesc="Library for handling the BD+ protection scheme on bluray discs"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.videolan.org/developers/libbdplus.html"
depends=('libaacs>=0.7.0')
source=("ftp://ftp.videolan.org/pub/videolan/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
md5sums=('f1ad1c67943d81e1e2e3ab1c1a8f3ebb')
