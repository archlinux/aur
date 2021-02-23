# Maintainer: Avery Murray <averylapine@gmail.com>

pkgname=libcimply
pkgver=0.5
pkgrel=2
pkgdesc="A simple library to get system and user information"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/caverym/cimplefetch"
license=('GPL3')
source=("https://github.com/caverym/libcimply/archive/${pkgver}.tar.gz")
sha256sums=('55fad5a4914d2e9e5f98dd7ea2ac16ee4cb6bc3ee2e6afc06cf3e28ef9b1ffee')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.a" "${pkgdir}/usr/lib/${pkgname}.a"
	install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.so" "${pkgdir}/usr/lib/${pkgname}.so"
	install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.h" "${pkgdir}/usr/include/${pkgname}.h"
}

