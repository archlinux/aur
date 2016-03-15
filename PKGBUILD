# Maintainer: Marcel Huber <`rev <<<"moc.liamg@oofrebuhlecram"`>
# Contributor: count-corrupt <corrupt at giggedy dot de>

pkgname=cisco-encrypt
pkgver=1.0
pkgrel=1
pkgdesc='Password encoder for Cisco VPN client'
url='http://staff.science.uva.nl/~bakkerr/obfuscate.c'
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libgcrypt>=1.1.90')
source=('http://staff.science.uva.nl/~bakkerr/obfuscate.c')
sha256sums=('b19f9cc58c11e9543d4b2021ffec683d8e3995f545399e9dd89059950f479f75')

build() {
	cd "${srcdir}"
	gcc -Wall -o "${pkgname}" obfuscate.c $(libgcrypt-config --libs --cflags)
}

package() {
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
