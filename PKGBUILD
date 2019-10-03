# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.10.2'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini'
license=('GPL')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e54dec793f12d8bc259a8c1d7c4c94f81d32a309b84d36c02d46e36f417abf4f')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr

}

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make

}

check() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make check

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

}

