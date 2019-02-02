# Maintainer: Waterloop <teamwaterloop@gmail.com>

pkgname=wio
pkgver=0.7.0
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
_cs_x86_64='d4527b10329186ddb3f182c1f41ff564deb5cec67e5aaf03691100a5170806c7'

_pkg_i686='i386'
_cs_i686='8ed28d0a2e0738d3d57b83991c633133fec7f4cf1c7dd3a7741bbd40299601f9'

_pkg_arm='arm5'
_cs_arm='6166450d2d6fb4743704a30463bcce48efdc501c0c2b9f2bf33eee14181109d0'

_pkg_armv6h='arm6'
_cs_armv6h='8e66c4d96cb520a3cfbd8b9390502166a14a8cb798c96ca7654adcf1df6c3c38'

_pkg_armv7h='arm7'
_cs_armv7h='2e5509a3f46021558de27060df334651e50cbe909c4d501666d4b5e2ca8e97c7'

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
