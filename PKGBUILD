# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='libgnunetworker'
pkgver='0.4.1'
pkgrel=1
pkgdesc='Multithreading with GNUnet'
arch=('i686' 'x86_64')
url="https://github.com/madmurphy/${pkgname}"
license=('AGPL')
depends=('gettext' 'gnunet')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
sha256sums=('16a7f4e41b3ff5c9fc4a2afc2fffda52cc3a7225d0ec633fc2ad5de6686fc891')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

