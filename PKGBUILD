# Maintainer: Avery Murray <averylapine@gmail.com>

pkgname=libcimply
pkgver=0.4
pkgrel=1
pkgdesc="A simple program to fetch system information written in C"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/caverym/cimplefetch"
license=('GPL3')
source=("https://github.com/caverym/libcimply/archive/${pkgver}.tar.gz")
sha256sums=('51f0e2020bbfc88b3273fe102c91071611dbd356174b406180ae9d23192c0017')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.so" "${pkgdir}/usr/lib/${pkgname}.so"
	install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.h" "${pkgdir}/usr/include/${pkgname}.h"
}

