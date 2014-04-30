# Author: Adrian Perez de Castro <aperez@igalia.com>
pkgname='signify'
pkgver='4'
pkgrel='1'
pkgdesc='OpenBSD tool to signs and verify signatures on files. Portable version.'
url='https://github.com/aperezdc/signify'
license=('BSD')
arch=('i686' 'x86_64' 'arm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aperezdc/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('92cb35f47c62ab6f3b931e4bf99c4e93')
depends=('libbsd')

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX='/usr'
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX='/usr' DESTDIR="${pkgdir}" install
}
