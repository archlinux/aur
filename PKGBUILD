# Author: Adrian Perez de Castro <aperez@igalia.com>
pkgname='signify'
pkgver='2'
pkgrel='1'
pkgdesc='OpenBSD tool to signs and verify signatures on files. Portable version.'
url='https://github.com/aperezdc/signify'
license=('BSD')
arch=('i686' 'x86_64' 'arm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aperezdc/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('c91db939a3c28eadc6294f31f0dfa705')
depends=('libbsd' 'openssl')

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX='/usr'
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX='/usr' DESTDIR="${pkgdir}" install
}
