# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='libgnunetworker'
pkgver='1.0.1'
pkgrel=1
pkgdesc='Multithreading with GNUnet'
arch=('i686' 'x86_64')
url="https://github.com/madmurphy/${pkgname}"
license=('AGPL')
depends=('gettext' 'gnunet')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
sha512sums=('e23f695e78fcef457b170a9ac3bff5ef6ea48e574c8f01e0ef9463c89dd354d445ac28b3031784c0ab312aa1cbfe0ad1b3fd1e7a8bd1a2e66c54660dcf8774d8')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

