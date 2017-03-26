# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=decox
pkgver=2.1
pkgrel=2
pkgdesc='Decreasing continuous exponentials; toy decompression planner'
url='http://fenua.org/gaetan/src/'
license=('ISC')
arch=('i686' 'x86_64' 'armv7h')
source=("${url}/${pkgname}-${pkgver}.c")
sha256sums=('12c46e35176c0e5b9fa529f727e7264cb8d289359e7c9a9be32f88def92b1e4b')

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
