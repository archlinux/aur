# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.7.1'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini/'
license=('GPL')
conflicts=('libconfini-git')
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('cb0056a97e652c3ca8acc40dd397efe8ec3c68ce0e4bade686a8c895cde79cae')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh --noconfigure
	./configure --prefix=/usr --disable-examples CFLAGS='-pedantic -std=c99 -g -O3'

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

