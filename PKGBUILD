pkgname='dwt'
pkgver='0.1'
pkgrel='1'
pkgdesc='Simple no-frills terminal emulator based on VTE'
license='MIT'
url='https://github.com/aperezdc/dwt'
source=( "http://people.igalia.com/aperez/files/${pkgname}-${pkgver}.tar.xz" )
sha1sums=('34edf979a79f916226d503386080bbfeb6915657')
arch=('i686' 'x86_64')
depends=('vte3' 'terminus-font')
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
