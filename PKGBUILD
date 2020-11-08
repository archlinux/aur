# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=decox
pkgver=2.2
pkgrel=1
pkgdesc='Decreasing continuous exponentials; toy decompression planner'
url='http://fenua.org/gaetan/src/'
license=('ISC')
arch=('i686' 'x86_64' 'armv7h')
source=("${url}/${pkgname}-${pkgver}.c")
sha256sums=('d35619795abead8a9a4291f2e43353b558c3c3a11e0e019877652feee69df56a')

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
