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
sha256sums=('3239648e630422c1b4ff460a8e775c58ecc565d7e05c18a1baa08b5ab20990e3')

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

