# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='libgnunetworker'
pkgver='1.0.2'
pkgrel=1
pkgdesc='Multithreading with GNUnet'
arch=('i686' 'x86_64')
url="https://github.com/madmurphy/${pkgname}"
license=('AGPL')
depends=('gettext' 'gnunet')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('5dc062b1894aafb28c58bbe648dca67b25a04e16d84371b7bc0cc06f7f1b858c64fe34ed0bd221146719638b265e5155208679490db0c0f71fd36bdd88fbce0c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

