# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='yamagi-quake2-ref_gl4'
pkgdesc='OpenGL 4.6 renderer for yamagi-quake2'
pkgver='1.10'
pkgrel='1'
url='https://github.com/yquake2/ref_gl4'
arch=('x86_64')
license=('GPL-2.0-only' 'LicenseRef-custom')
depends=('glibc' 'glu' 'sdl3' 'yamagi-quake2')
_refgl4="ref_gl4-${pkgver}"
source=("${_refgl4}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('12da532a282ec38b7a9162fb92442c259b224ef8487314eb7ab4b8c4fb0b4c56d7a65602d9c1d38451e48ff12148f9fb29387421d88b2bc7a9d3c4e6478ee3ce')

build() {
	make -C "${srcdir}/${_refgl4}"
}

package() {
	# library
	install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2" "${srcdir}/${_refgl4}/release/ref_gl4.so"

	# doc
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/${_refgl4}/README.md"

	# license
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${_refgl4}/LICENSE"
}
