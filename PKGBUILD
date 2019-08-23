# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: Malina Salina <bluesilence@hotmail.co.uk>
pkgname='reop'
pkgver='2.1.1'
pkgrel='1'
pkgdesc='Utility to create and verify cryptographic signatures'
url='https://github.com/tedu/reop/'
license=('MIT')
arch=('arm' 'i686' 'x86_64')
depends=('libsodium>=1.0.8')
conflicts=('reop-git')
options=('zipman')
source=("http://www.tedunangst.com/flak/files/${pkgname}-${pkgver}.tgz")
sha512sums=('ce145cfb7c2347c4df4b6a25f28dab22d6bd0b3cf27d9fcb42b81d969634b122b706aff01c1c3108557d5778981dd8a025ac29d1aa2dfe9e77902ed24daa8ef1')


build () {
	cd "${pkgname}-${pkgver}"
	make
}

check () {
	cd "${pkgname}-${pkgver}/tests"
	chmod +x test.sh
	./test.sh
}

package () {
	cd "${pkgname}-${pkgver}"
	install -Dm755 reop "${pkgdir}/usr/bin/reop"
	install -Dm644 reop.1 "${pkgdir}/usr/share/man/man1/reop.1"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
