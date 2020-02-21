# Maintainer: Marco von Rosenberg <codingmarco@gmail.com>

pkgname=mlrpt
pkgver=1.6.4
pkgrel=2
pkgdesc="Non-interactive command-line version of glrpt for receiving, decoding and saving LRPT images from the Russian Meteor-M type of weather satellites"
arch=('x86_64')
url="http://www.5b4az.org"
license=('GPLv3')
depends=('rtl-sdr' 'airspy')
makedepends=('make' 'automake' 'autoconf')
source=("http://www.5b4az.org/pkg/lrpt/${pkgname}-${pkgver}.tar.bz2")
md5sums=('d0b936407cbae52178a16fab761977cc')
                    
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
