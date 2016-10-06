# Maintainer: grufo <madmurphy333@gmail.com>

pkgname=libconfini
pkgver=0.9
pkgrel=2
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url="https://github.com/madmurphy/libconfini/"
license=("GPL")
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}-${pkgrel}.tar.gz")
md5sums=('9dd5f0e4ec4b6cc960ca8bcd4e3000de')

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

