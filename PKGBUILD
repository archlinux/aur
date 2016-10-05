# Maintainer: grufo <madmurphy333@gmail.com>

pkgname=libconfini
pkgver=0.9
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url="https://github.com/madmurphy/libconfini/"
license=("GPL")
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('e33e995ad07f9d2a106378aeb1c1e2e0')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr

}

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install

}

