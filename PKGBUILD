pkgname='dwt'
pkgver='0.4'
pkgrel='1'
pkgdesc='Simple no-frills terminal emulator based on VTE'
license='MIT'
url='https://github.com/aperezdc/dwt'
source=( "http://people.igalia.com/aperez/files/${pkgname}-${pkgver}.tar.xz" )
sha1sums=('a13469c32c0437b31b20ea1d77b96dca2bc685f8')
arch=('i686' 'x86_64' 'arm')
depends=('vte3')
options=('strip' 'zipman')

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}/" install
	chmod 2755 "${pkgdir}/usr/man" "${pkgdir}/usr/man/man1"
}
