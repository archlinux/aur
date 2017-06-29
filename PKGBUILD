# Maintainer: Dominic Radermacher <blip@mockmoon-cybernetics.ch>
pkgname=pslib
pkgver=0.4.5
pkgrel=4
pkgdesc="pslib is a C-library to create PostScript files on the fly"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://pslib.sourceforge.net/"
license=('GPL')
depends=('glibc' 'libjpeg' 'libpng' 'libtiff' 'perl' 'perl-xml-parser' 'intltool')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('7a33928982b281660206bb3749a4a563e3ac987eea64f41696f212df345212be')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}
package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
