# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.12.0'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini'
license=('GPL')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ef5af85f174fe786a106c08d3330d189a9d5431ad70657310ebbc58bb09b6bd6')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	./bootstrap --prefix=/usr

}

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

}

