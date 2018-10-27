# Maintainer: Waterloop <teamwaterloop@gmail.com>

pkgname=wio
pkgver=0.6.0
pkgrel=1
pkgdesc='An IoT Development Environment'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url='https://github.com/wio/wio'
license=('MIT')
options=('!strip')
depends=('make' 'cmake')
optdepends=('avr-gcc: compiler for AVR'
            'avr-libc: libc for AVR'
            'avrdude: for uploading to Arduino based boards'
            'gcc: for compiling natively')

_pkg_x86_64='x86_64'
_cs_x86_64='27cc17082996960dadee6b31973e5d1df08ebefcdebc7456ce038a58ada7e871'

_pkg_i686='i386'
_cs_i686='d7f14e02520ee3b6d9457f386e42de68c3086db6fc7a52b97c880d31dd8b7458'

_pkg_arm='arm5'
_cs_arm='101e9f15f4d6775ed05c3abfa26661265d3ed2d4e338442c88a341792159c2a4'

_pkg_armv6h='arm6'
_cs_armv6h='45a8408769962b3042e7a2d62f0a249bf62610aff4e569613220404c9a3be828'

_pkg_armv7h='arm7'
_cs_armv7h='f296dc424e56170b3381ca9a97b87d2dce8e745dafc6db642e6245ce919c77ab'

_pkg_str="_pkg_${CARCH}"
_cs_str="_cs_${CARCH}"

source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/wio_linux_${!_pkg_str}.tar.gz")
sha256sums=("${!_cs_str}")

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/bin/"
	cp "wio_linux_${!_pkg_str}" "${pkgdir}/usr/bin/wio"
	mkdir -p "${pkgdir}/usr/share/wio"
	cp -R toolchain "${pkgdir}/usr/share/wio/toolchain"
}
