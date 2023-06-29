# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='anastasis'
pkgname="${_framework}-gtk"
pkgver='0.3.2'
pkgrel=1
pkgdesc='Graphical user interface for GNU Anastasis'
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/${_framework}"
license=('GPL')
depends=('anastasis' 'jansson' 'gnunet' 'gnunet-gtk' 'gtk3' 'libgcrypt'
         'libmicrohttpd' 'postgresql' 'taler-exchange' 'taler-merchant')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("ftp://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b71d341f323e9a6b3fadd60abf7b7a8073413609bad850541261592f0018523b7421be913359a01b7feba0bb162c2b5e3a874c4bd24cf673b0e9b6e1629f04de')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

