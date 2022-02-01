# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='libgnunetworker'
pkgver='0.4.0'
pkgrel=1
pkgdesc='Multithreading with GNUnet'
arch=('i686' 'x86_64')
url="https://github.com/madmurphy/${pkgname}"
license=('AGPL')
depends=('gettext' 'gnunet')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
sha256sums=('c79e041345186ab617af3398c236f25ddfe64ab2238e4b55b22f787184af8ff3')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

