# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='anastasis'
pkgname="${_framework}-gtk"
pkgver='0.4.1'
pkgrel=1
pkgdesc='Graphical user interface for GNU Anastasis'
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/${_framework}"
license=('GPL')
depends=('anastasis' 'imagemagick' 'jansson' 'gnunet' 'gnunet-gtk' 'glade'
         'gtk3' 'libgcrypt' 'libharu' 'libmicrohttpd' 'postgresql'
         'taler-exchange' 'taler-merchant')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("ftp://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e05da6117d94247179648fac0a1d124f948fa8a428a7660a5248b5ff552f8bd013cd204e10c0a2d75041db478a82ae94cbc11fe19f09622d3e41f3dc70b279bf')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

