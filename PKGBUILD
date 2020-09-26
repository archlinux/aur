# Maintainer: Dominic Radermacher <blip@mockmoon-cybernetics.ch>
pkgname=pslib
pkgver=0.4.6
pkgrel=1
pkgdesc="pslib is a C-library to create PostScript files on the fly"
arch=('x86_64' 'aarch64' 'armv7h')
url="http://pslib.sourceforge.net/"
license=('GPL')
depends=('glibc' 'libjpeg' 'libpng' 'libtiff' 'perl' 'perl-xml-parser' 'intltool')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('642e8405c85dc2ebcd307e0b46ed3d366fd28de098c6d8b717720689270b2954')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}
package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
