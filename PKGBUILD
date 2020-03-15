# Maintainer: Marco von Rosenberg <codingmarco@gmail.com>

pkgname=glrpt
pkgver=2.4.5
pkgrel=1
pkgdesc="Interactive GUI application for receiving, decoding and displaying LRPT images from the Russian Meteor-M type of weather satellites"
arch=('x86_64')
url="http://www.5b4az.org"
license=('GPLv3')
depends=('gtk3'
         'libglade'
         'soapysdr')
optdepends=('soapyrtlsdr: RTL-SDR support'
            'soapyairspy: Airspy support')
provides=(glrpt)
conflicts=(glrpt-git)
makedepends=('make' 'automake' 'autoconf' 'xorgproto')
source=("http://www.5b4az.org/pkg/lrpt/${pkgname}-${pkgver}.tar.bz2")
md5sums=('5aee4d813cd3a00e5c09ed5ee39be758')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
