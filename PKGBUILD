pkgname='dwt'
pkgver='0.5'
pkgrel='1'
pkgdesc='Simple no-frills terminal emulator based on VTE'
license='MIT'
url='https://github.com/aperezdc/dwt'
source=( "http://people.igalia.com/aperez/files/${pkgname}-${pkgver}.tar.xz" )
sha1sums=('4293ae216731ff4a4b4c5ed80c5ca147847e6aa7')
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
