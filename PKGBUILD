# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.8.1'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini/'
license=('GPL')
conflicts=('libconfini-git')
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d75e767d9487c9691e1c16c29e3fe9ec87e726505edae5c9a062b6118061873d')

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

