# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=decox
pkgver=1.4
pkgrel=1
pkgdesc='Decreasing continuous exponentials; toy decompression planner'
url='http://fenua.org/gaetan/src/'
license=('ISC')
arch=('i686' 'x86_64' 'armv7h')
source=("${url}/${pkgname}-${pkgver}.c")
sha1sums=('5991f6bd37f22b0fa4d6913048c44b1b6c16e7b9')

build() {
	cd "${srcdir}"
	cc -lm \
		${CFLAGS} ${LDFLAGS} \
		-o ${pkgname} ${pkgname}-${pkgver}.c
}

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	head -n 15 "${pkgname}-${pkgver}.c" > "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
