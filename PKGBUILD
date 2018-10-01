# Maintainer: Waterloop <teamwaterloop@gmail.com>

pkgname=wio
pkgver=0.5.0
pkgrel=1
pkgdesc='An IoT Development Environment'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url='https://github.com/wio/wio'
license=('MIT')
options=("!strip")
depends=('make' 'cmake')
optdepends=('avr-gcc: compiler for AVR'
            'avr-libc: libc for AVR'
            'avrdude: for uploading to Arduino based boards'
            'gcc: for compiling natively')

_pkg_x86_64='x86_64'
_cs_x86_64='1a2da7a717eda51254cc391dc07553f1e5a73e553429d6510875f7d2edba18a2'

_pkg_i686='i386'
_cs_i686='ae905270a05fa9ba0c3ebb637e21c941b4ae1440c0a305d8e5f237c4036d2e42'

_pkg_arm='arm5'
_cs_arm='c77a0e054fd08c3dccf4fa66d5c2e7eb1a442a4ca5276d1bb287378c4c84b8a4'

_pkg_armv6h='arm6'
_cs_armv6h='7d17944714271e8c8655c852d0647845b385d952672095c170180dda7d3ee8f0'

_pkg_armv7h='arm7'
_cs_armv7h='7df516560a8c1ae386d41bcb37177d934ee8094d2b11f2950f92bc3f1aeaf49e'

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
