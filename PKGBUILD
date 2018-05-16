# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='stripcmt'
pkgver='0.1.2'
pkgrel=1
pkgdesc='Simple utility to remove comments from C, C++, and Java source files'
arch=('i686' 'x86_64')
url='http://www.bdc.cx/software/stripcmt/'
license=('GPL')
source=("http://www.bdc.cx/download/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d683c866c2139cd6948f43e7c8a8f259da14ad21594caf41cc004ae2188a571f')

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}"

	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/local/man/man1"

	cp "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	cp "${srcdir}/${pkgname}-${pkgver}/${pkgname}.1" "${pkgdir}/usr/local/man/man1/${pkgname}.1"

}

