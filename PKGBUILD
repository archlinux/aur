# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='yamagi-quake2-ref_gl4'
pkgdesc='OpenGL 4.6 renderer for yamagi-quake2'
pkgver=1.07
pkgrel=2
url='https://github.com/yquake2/ref_gl4'
arch=('x86_64')
license=('GPL-2.0-only' 'LicenseRef-custom')
depends=('glibc' 'sdl2' 'yamagi-quake2')
_refgl4="ref_gl4-${pkgver}"
source=("${_refgl4}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('0ca58174bc000c20ea1c338fa7c99ab50861110042a38eeefc04d76d0f0f7f357139481410a63369e00bbf360372be4b6b4fe0659c4111242c86e45ea260acb7')

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
