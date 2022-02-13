# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='anastasis'
pkgname="${_framework}-gtk"
pkgver='0.2.0'
pkgrel=1
pkgdesc='Graphical user interface for GNU Anastasis'
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/${_framework}"
license=('GPL')
depends=('anastasis' 'jansson' 'gnunet' 'gnunet-gtk' 'gtk3' 'libgcrypt'
         'libmicrohttpd' 'postgresql' 'taler-exchange' 'taler-merchant')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("ftp://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('81547ad8152cb2b15f9cc3a94b3c4a329efe0a8f16e3d987f8be3749612b440a04eb5f2e1a7880c522832b8d856eee0d080ec03fa580be5161678c1f4bc23d44')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

