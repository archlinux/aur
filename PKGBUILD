# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.10.1'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini'
license=('GPL')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d1e71164228c08ea4439f5e31e86b7e0f29cdf4ae18ba58e5319f5fc04ab9aaf')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr

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

