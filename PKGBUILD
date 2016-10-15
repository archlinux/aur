# Maintainer: grufo <madmurphy333@gmail.com>

pkgname=libconfini
pkgver=1.1
pkgrel=2
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url="https://madmurphy.github.io/libconfini/"
license=("GPL")
makedepends=('intltool')
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}-${pkgrel}.tar.gz")
md5sums=('18e1e03b401d01250556fb1f42116da7')

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

