# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='yamagi-quake2-ref_gl4'
pkgdesc='OpenGL 4.6 renderer for yamagi-quake2'
pkgver=1.07
pkgrel=1
url='https://github.com/yquake2/ref_gl4'
arch=('x86_64')
license=('GPL-2.0-only' 'custom')
depends=('yamagi-quake2')
makedepends=('git' 'sdl2' 'mesa')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('0ca58174bc000c20ea1c338fa7c99ab50861110042a38eeefc04d76d0f0f7f357139481410a63369e00bbf360372be4b6b4fe0659c4111242c86e45ea260acb7')
_srcdir="ref_gl4-${pkgver}"

build() {
	make -C "$_srcdir"
}

package() {
	# library
	install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2" "${_srcdir}/release/ref_gl4.so"

	# doc
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${_srcdir}/README.md"

	# license
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcdir}/LICENSE"
}
