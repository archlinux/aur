# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini'
pkgver='1.11.0'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini'
license=('GPL')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ca8bcb288ac5973dd6836c4e9702100781d0f0cdafb79ad170183ecfb56028d7')

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

