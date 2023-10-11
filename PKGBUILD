# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='anastasis'
pkgname="${_framework}-gtk"
pkgver='0.4.0'
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
sha512sums=('3bad56ba4c5c5d5c97790ef3d70829dafd9e96f939feafb1f1193a7d9548e08c7dd2db63347c63ccefbc080a3cd0a613e3f99c4355a8de972092c9158b350acc')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

