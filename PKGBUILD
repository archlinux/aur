# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.10.3'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini'
license=('GPL')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('74703f7ba97546a5a06c3a520cca15c24523c17fa407d0b52a758660e7583553')

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

