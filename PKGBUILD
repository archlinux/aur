# Maintainer: grufo <madmurphy333@gmail.com>

pkgname=libconfini
pkgver=0.9
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url="https://github.com/madmurphy/libconfini/"
license=("GPL")
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}-${pkgrel}.tar.gz")
md5sums=('b726a08a4cdb3539035ea75a787f8137')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
	./autogen.sh
	./configure --prefix=/usr

}

build() {

	cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
	make

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
	make DESTDIR="${pkgdir}" install

}

