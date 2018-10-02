# Maintainer: Busindre <busilezas at busindre dot com>

pkgname=balance
pkgver=3.57
pkgrel=1
pkgdesc='Command line TCP load balancing with round-robin and failover.'
arch=('any')
url='https://www.inlab.net/balance/'
license=('GPL')
depends=('glibc')
source=("https://www.inlab.net/wp-content/uploads/2018/05/${pkgname}-${pkgver}.tar.gz")
sha512sums=('191195e2aa62c867d85085f273db911e8957c3eea7bed8e58abc29e125a0b0a4487048c7db5857e32f54545de1f81f8148b174225aaf8cf1e3a66e4b040748b4')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make
}

package() {

	install -d "${pkgdir}/usr/bin" 
	install -d "${pkgdir}/usr/share/man/man1"
	install -d "${pkgdir}/run/balance"

	cd ${srcdir}/${pkgname}-${pkgver}
	install -D -m755  balance ${pkgdir}/usr/bin/
	install -D -m755  balance.1  ${pkgdir}/usr/share/man/man1/
	install -d  ${pkgdir}/run/balance
}
