# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.8.6'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini/'
license=('GPL')
conflicts=('libconfini-git')
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('79dc7510c73e62acc30bdec9163eaa14fbd1e19d26bd7b2f5c9c8eb4b94e4dc4')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr CFLAGS='-pedantic -std=c99 -g -O2'

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

