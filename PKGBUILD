# Maintainer: grufo <madmurphy333@gmail.com>

pkgname=libconfini
pkgver=1.2
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url="https://madmurphy.github.io/libconfini/"
license=("GPL")
makedepends=('intltool')
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}-${pkgrel}.tar.gz")
md5sums=('bf39cc14976a580cc2ed39a0b3851994')

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
	chmod +x "${pkgdir}/usr/share/doc/${pkgname}/examples/compile_example.sh"

}

